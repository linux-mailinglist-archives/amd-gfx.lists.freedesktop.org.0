Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451E9B110
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 15:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB4E6EC98;
	Fri, 23 Aug 2019 13:37:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810041.outbound.protection.outlook.com [40.107.81.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C366EC98
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 13:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmyOflyd2G1tMwSwkV5bpZK/2Uqsa6aEQKfx4xZPYXe/xA65KGlqnBkf5gaXWOOIuHfxXX1BwFLphi6bcxZdjhNGxMjxYVL0AfHTk1NmrYOTUE3hdz6SgqoIIGdAMkm6kicY1ocAxanfqsvEcbqMKQrEfeHV31EYsl9fH6e9dsBJ9zfcBp6Xjpncezbi5d7IrrdDUrHrBlOhBzrTiDXB7Zmd8zldvM57FGf1foKsPmUcR1uKkg0T/UCQFjJSzkH5OQi5xpJj6VkfJ9Q7+r3GTq7OGqGkrfA9WalcgVHJ5ygH/YUMw5UiMBlgpRQYPluzHaOZMKhyax1xTVlaVQDGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqpyMI58fTSc9y9AyLeU+4EbSqjm80vCp35Sl5gFUSk=;
 b=gUAeSxBXKpDAE4V4W8NejsRanpGMb3WuHk3PfkaV3KmcohAApCAySAlTcb0YTm/DTwWXgXSDU9B7LgamD2VFO3ri4t4x9nEE+piypuCibGQ2KohBtYwtBWKs2TrBhhD7GQvpt6jzZ+ppm6sSiLFt/ypuij/jHjoV0zgM8hfwYYAI3e+X6HnSfVTKlol2X5BCd28KWztdTa6eRZHJT7hDq74OliGtzMfEjcIpWjhJOYvRMgUDdf8awSP137HpX4zBRkxJlKXNsVG/Kwn1a8iqLQg7xPEid80JD7KMj6nWFJy/zM98wLOgTYHPYTNysOi6rhAhUrfDtkFVNWLdwyH0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1249.namprd12.prod.outlook.com (10.168.227.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Fri, 23 Aug 2019 13:37:09 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::4d5d:1a87:aac9:d7b2%10]) with mapi id 15.20.2178.020; Fri, 23 Aug
 2019 13:37:09 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/powerplay: Fix Vega20 power reading again
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 power reading again
Thread-Index: AQHVWbfcVzHz3YyhgEiNFpFyEd6YVQ==
Date: Fri, 23 Aug 2019 13:37:09 +0000
Message-ID: <20190823133652.31774-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 197c7bb8-ac17-4eee-2e3f-08d727ceff0e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1249; 
x-ms-traffictypediagnostic: BN6PR12MB1249:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1249E7DC1BD02BCB1144D06985A40@BN6PR12MB1249.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(199004)(189003)(25786009)(6916009)(4326008)(1076003)(256004)(316002)(386003)(81156014)(66446008)(66946007)(66476007)(66556008)(64756008)(2501003)(6506007)(8936002)(5640700003)(7736002)(8676002)(6436002)(81166006)(53936002)(5660300002)(86362001)(6512007)(71200400001)(52116002)(2351001)(66066001)(14454004)(476003)(305945005)(36756003)(6486002)(186003)(71190400001)(478600001)(50226002)(99286004)(6116002)(3846002)(102836004)(2906002)(486006)(26005)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1249;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +hv5vw6qTN6bAvrbJFhBKBP5lh4huk3VqC8ysYwovg6nRhArRPQeBHh/zkIxuJOjnjnAImuXGpihUqBZRWvCIj6l4/rWWzVHRf9Y5WQfXkXWUIsPHqy71Wa/SzRENgN+RBvLZd5nKePJwNz6z0cTXVBRMqvzbWTINHFv1zZcYe7S7s26OcTvOJVYMrDMLjHpJa/ke0wEQ5U5DCQTX8Qh/N2ytMc0WTwoMkYU8hW9iXvBbQrY42Ca4sK/aB4nynXGPbjmFByY7DpR+tCsREyOZ4lf4Uj70sp2LD/g2IZKddssVQQtX1KlHmk0EXd76Ij4BN5aCRlqCKgVIwKwgsrIM5Stfl2eAENyxmmkehqwfxX3jHqJyY4muwEej6aEYX+RTzZWIHRQtT9VCjGZjCvjGqbx1hTSUfGiSpWWL/+w55I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197c7bb8-ac17-4eee-2e3f-08d727ceff0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 13:37:09.5448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: elm0y5MEF0BUYE7MpDvnHMYTzol8qRMUf5GlgGO/Kj606k96fxsOxGCmVL2q1IaRQwfj9LGOeNxw7yb2mqXxuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1249
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqpyMI58fTSc9y9AyLeU+4EbSqjm80vCp35Sl5gFUSk=;
 b=xTF16P3p/mqfSahCnPolDd9X5QYfjnby9B+D9tNnggTUKx8S1cqwac1Rjd7qRI0WhDFpwdiTZ1+cjRygp0JWXPxacs6Blh88N7Vhat1Y/6RHnEkQNmErFvGckZmtgPA/Cs+KrT05yFg2bc/0uJdcQicPgtr5K3wSU+M8nDf66Rc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIHRoZSA0MC40NiBTTVUgcmVsZWFzZSwgdGhleSBjaGFuZ2VkIEN1cnJTb2NrZXRQb3dlciB0
bwpBdmVyYWdlU29ja2V0UG93ZXIsIGJ1dCB0aGlzIHdhcyBjaGFuZ2VkIGJhY2sgaW4gNDAuNDcg
c28ganVzdCBjaGVjayBpZgppdCdzIDQwLjQ2IGFuZCBtYWtlIHRoZSBhcHByb3ByaWF0ZSBjaGFu
Z2UKClRlc3RlZCB3aXRoIDQwLjQ1LCA0MC40NiBhbmQgNDAuNDcgc3VjY2Vzc2Z1bGx5CgpDaGFu
Z2UtSWQ6IEljYmJlNmZkMzM4MWI4YWQ2Mjk4YzJkMDg1MmE3MjZmZmFjOThmOTNhClNpZ25lZC1v
ZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgfCA3ICsrKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyAgICAgICAgIHwgNyArKysr
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdt
Z3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5j
CmluZGV4IDlmNTBhMTJmNWMwMy4uOThhNmY1MzA1OTc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwpAQCAtMjEwMSwxMCArMjEw
MSwxMSBAQCBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCWlmIChod21nci0+c211X3ZlcnNp
b24gPCAweDI4MmUwMCkKLQkJKnF1ZXJ5ID0gbWV0cmljc190YWJsZS5DdXJyU29ja2V0UG93ZXIg
PDwgODsKLQllbHNlCisJLyogRm9yIHRoZSA0MC40NiByZWxlYXNlLCB0aGV5IGNoYW5nZWQgdGhl
IHZhbHVlIG5hbWUgKi8KKwlpZiAoaHdtZ3ItPnNtdV92ZXJzaW9uID09IDB4MjgyZTAwKQogCQkq
cXVlcnkgPSBtZXRyaWNzX3RhYmxlLkF2ZXJhZ2VTb2NrZXRQb3dlciA8PCA4OworCWVsc2UKKwkJ
KnF1ZXJ5ID0gbWV0cmljc190YWJsZS5DdXJyU29ja2V0UG93ZXIgPDwgODsKIAogCXJldHVybiBy
ZXQ7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXgg
MGZhYzgyNDQ5MGQ3Li44OTliZjk2YjIzZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS92ZWdhMjBfcHB0LmMKQEAgLTI5MzIsMTAgKzI5MzIsMTEgQEAgc3RhdGljIGludCB2ZWdh
MjBfZ2V0X2dwdV9wb3dlcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKnZhbHVl
KQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlpZiAoc211X3ZlcnNpb24gPCAweDI4MmUw
MCkKLQkJKnZhbHVlID0gbWV0cmljcy5DdXJyU29ja2V0UG93ZXIgPDwgODsKLQllbHNlCisJLyog
Rm9yIHRoZSA0MC40NiByZWxlYXNlLCB0aGV5IGNoYW5nZWQgdGhlIHZhbHVlIG5hbWUgKi8KKwlp
ZiAoc211X3ZlcnNpb24gPT0gMHgyODJlMDApCiAJCSp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZVNv
Y2tldFBvd2VyIDw8IDg7CisJZWxzZQorCQkqdmFsdWUgPSBtZXRyaWNzLkN1cnJTb2NrZXRQb3dl
ciA8PCA4OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
