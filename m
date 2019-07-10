Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC1A64972
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 17:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF446E0FE;
	Wed, 10 Jul 2019 15:20:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5196E0FE
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 15:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0fZLr2MPm40W4Vmt+9LsEh/ZHazJjx1koTySg4NwSJj1nGLY4u+KqqeJSGIceIT3OGS/5G23tvIaRnR8IREof00GHWxDrFyVFQY1k4eXo/AJVa9pKRfkU1Eb7gcJgKukdB+Z6dh5RU+/v3tS+d6g/SQq98i+zgX9vg3wAXq8AJTTLw8/2YgUrZzn1GxFWyF+OYkqo6NxRjOwc6JbmLiOR/XFoawzzMfJWJy61o/3CpSLxad1hnqKbMsVQLOXoiRNeHRd49Zu3UGeZuvsmOQ7wtEabLSX62pmtMNxMuISehrEClC0LLAANaZ5KlAheY5qlZ7qhATQ9IhJs43489jeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSxZMiq7fIrf+d+UsVUJUHJNUjGj6K4LOpnKgQwdwpc=;
 b=K9kt5famvPZiN3bJu2garD0LEC2E9w0NEykHwY5w+tKZy3yS0Zop6aX0qk6zbp0eNqctEWrMdT8Nc9Tgvu3jp7swQRgL5HDjpthtGO/Ua4R+uhRxoqUImeTDp3pTukeH1buH6F+AifmWBpjB7qhGA2kZyPe0TDG+xmJWNJhjWZs5wb/dGdPyLAKFNFFXuo8fRmzOqV+BDB5FGdUDQ460CpIdPSwf5qLWc5CQZ8vrIVigfywsxPbtesQRNG/vUtGM1QJlDWrZsr7qXOS4htrrUFjBDVZhtFko3gRyysuyQ5HcSTL/JERliRZ+0wbB3knnL6C8bolQFq2Gauw7W9rj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (52.132.141.147) by
 DM5PR12MB1849.namprd12.prod.outlook.com (10.175.85.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 15:20:50 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d%4]) with mapi id 15.20.2073.008; Wed, 10 Jul 2019
 15:20:50 +0000
From: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Topic: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Index: AQHVNzMOyh0y41xtzkOlOnqCEyNiHA==
Date: Wed, 10 Jul 2019 15:20:50 +0000
Message-ID: <1562772046-7681-1-git-send-email-JinhuiEric.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::34) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ea1307e-6181-4da4-dc3a-08d7054a30f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1849; 
x-ms-traffictypediagnostic: DM5PR12MB1849:
x-microsoft-antispam-prvs: <DM5PR12MB18495B483771233990F0D47682F00@DM5PR12MB1849.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(99286004)(71200400001)(86362001)(386003)(52116002)(6506007)(66066001)(2351001)(2501003)(7736002)(2906002)(36756003)(6486002)(6436002)(71190400001)(26005)(14454004)(102836004)(305945005)(186003)(68736007)(66446008)(4326008)(476003)(66946007)(2616005)(486006)(6916009)(66476007)(66556008)(5660300002)(25786009)(81166006)(81156014)(6512007)(5640700003)(50226002)(64756008)(14444005)(256004)(8936002)(3846002)(6116002)(478600001)(54906003)(316002)(53936002)(8676002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1849;
 H:DM5PR12MB2504.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: utFlunH4QE9XbmR96r0SNzkbF+CbF2c++iCP5sJZSLewL8Urw1SjHK/tbm5/rrKf9ZXxUP4f+oZmxpzaHIRWn1hn1ixlHbzCQYYszJ6GCOR4RheG2fizty0oV4Zo9hfMd1DBkkWaCs35LA8WyQVETCeHDOwY5IB5wQntt4UGykzq+bj4F5vQcWWNjSaMwWbdI1GGFW0WQ5fYiQURImXnoAP3qGux8O7QcVeLAO+3MJmjOwdEa2Dr4u3T7WDdUyjAMCrBzxYzo5DRhfe1paEi9HpSEwdYfvC9WZcOkhXVNgYbmLxTvc+SGup17BPcHanpWYdlAoPNpraVT1Mny61VoYmTHKZSmhXwEvgcPtnURejZJIGAaeiywgpTx7iHgyI7UsmUWxlbi3BWM+0GmjhecxzeP7PLY0qt1MCZ/+kLydw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea1307e-6181-4da4-dc3a-08d7054a30f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 15:20:50.5022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jinhuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSxZMiq7fIrf+d+UsVUJUHJNUjGj6K4LOpnKgQwdwpc=;
 b=AyMzVerhSFi5bVZUUH51+b0EtUMEReuZjE5n8/GWJBvkhvzPV4yAS3t3k2jqbF8NocH+OtE2SqwInx3rS/xCSgsTSwdhF3S72k0SRbiSlG3mNYkaviRrxv9bCeIhEOwxQzps+2UXNxHDbO4zbztxf4pZLDOZr1LTFBgEEjf4WD4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JinHuiEric.Huang@amd.com; 
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
Cc: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGNwIGhhbmcgb2NjdXJzIGluIE9DTCBjb25mb3JtYW5jZSB0ZXN0IG9ubHkgb24gc3VwZXJt
aWNybwpwbGF0Zm9ybSB3aGljaCBoYXMgNDAgY29yZXMgYW5kIHRoZSB0ZXN0IGdlbmVyYXRlcyA0
MCB0aHJlYWRzLgpUaGUgcm9vdCBjYXVzZSBpcyByYWNlIGNvbmRpdGlvbiBpbiBub24tcHJvdGVj
dGVkIGZsYWdzLgoKVGhlIGZpeCBpcyB0byBhZGQgZmxhZ3Mgb2YgaXNfZXZpY3RlZCBhbmQgaXNf
YWN0aXZlKGluaXRfbXFkKCkpCmludG8gcHJvdGVjdGVkIGFyZWEuCgpTaWduZWQtb2ZmLWJ5OiBF
cmljIEh1YW5nIDxKaW5odWlFcmljLkh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAxNiArKysrKysrKystLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmMKaW5kZXggOWZmZGRhNS4uZjIzZTE3YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKQEAgLTExNTcsMTIgKzEx
NTcsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVl
X21hbmFnZXIgKmRxbSwgc3RydWN0IHF1ZXVlICpxLAogCiAJbXFkX21nciA9IGRxbS0+bXFkX21n
cnNbZ2V0X21xZF90eXBlX2Zyb21fcXVldWVfdHlwZSgKIAkJCXEtPnByb3BlcnRpZXMudHlwZSld
OwotCS8qCi0JICogRXZpY3Rpb24gc3RhdGUgbG9naWM6IG1hcmsgYWxsIHF1ZXVlcyBhcyBldmlj
dGVkLCBldmVuIG9uZXMKLQkgKiBub3QgY3VycmVudGx5IGFjdGl2ZS4gUmVzdG9yaW5nIGluYWN0
aXZlIHF1ZXVlcyBsYXRlciBvbmx5Ci0JICogdXBkYXRlcyB0aGUgaXNfZXZpY3RlZCBmbGFnIGJ1
dCBpcyBhIG5vLW9wIG90aGVyd2lzZS4KLQkgKi8KLQlxLT5wcm9wZXJ0aWVzLmlzX2V2aWN0ZWQg
PSAhIXFwZC0+ZXZpY3RlZDsKKwogCWlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVF
X1RZUEVfU0RNQSB8fAogCQlxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RN
QV9YR01JKQogCQlkcW0tPmFzaWNfb3BzLmluaXRfc2RtYV92bShkcW0sIHEsIHFwZCk7CkBAIC0x
MTczLDkgKzExNjgsMTYgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfY3BzY2goc3RydWN0IGRl
dmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVjdCBxdWV1ZSAqcSwKIAkJcmV0dmFsID0gLUVO
T01FTTsKIAkJZ290byBvdXRfZGVhbGxvY2F0ZV9kb29yYmVsbDsKIAl9CisKKwlkcW1fbG9jayhk
cW0pOworCS8qCisJICogRXZpY3Rpb24gc3RhdGUgbG9naWM6IG1hcmsgYWxsIHF1ZXVlcyBhcyBl
dmljdGVkLCBldmVuIG9uZXMKKwkgKiBub3QgY3VycmVudGx5IGFjdGl2ZS4gUmVzdG9yaW5nIGlu
YWN0aXZlIHF1ZXVlcyBsYXRlciBvbmx5CisJICogdXBkYXRlcyB0aGUgaXNfZXZpY3RlZCBmbGFn
IGJ1dCBpcyBhIG5vLW9wIG90aGVyd2lzZS4KKwkgKi8KKwlxLT5wcm9wZXJ0aWVzLmlzX2V2aWN0
ZWQgPSAhIXFwZC0+ZXZpY3RlZDsKIAltcWRfbWdyLT5pbml0X21xZChtcWRfbWdyLCAmcS0+bXFk
LCBxLT5tcWRfbWVtX29iaiwKIAkJCQkmcS0+Z2FydF9tcWRfYWRkciwgJnEtPnByb3BlcnRpZXMp
OwotCWRxbV9sb2NrKGRxbSk7CiAKIAlsaXN0X2FkZCgmcS0+bGlzdCwgJnFwZC0+cXVldWVzX2xp
c3QpOwogCXFwZC0+cXVldWVfY291bnQrKzsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
