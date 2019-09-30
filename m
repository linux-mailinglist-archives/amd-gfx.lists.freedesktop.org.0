Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC5CC1BF7
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 09:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E6789D46;
	Mon, 30 Sep 2019 07:14:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750072.outbound.protection.outlook.com [40.107.75.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63C889D46
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 07:14:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9QF6bh4ThhCb56yr3hZm1bDXYKPycjOTCBbgb0p/8eEVJDymHYwJz9+ce8xrI0g7SRYbp5mc1yZtpKr5yW8cYILV3SkD2M4ZUGSI707U7WgaZyT3D3PLsDmyMKp95td3nSqBDo4IXGIZqS0OELFMCB3p1/pOto1R2Emblmr5heFF9DaK/m1IsDUKcygtNtAWWyPnaxOWALjTSVbXEUWWy6U1J/UfbHQroFfR98kn/NU9M3qrvDfvWCgLuH18VgF74dwD65Rg3xGKPCZmRoZIgsjYcDx5p/wnW3QxXDAEek+r3SOHiXU0e5Vm2Q0dv8HcdwLI1Bg7JPPsx8K7pKVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXP282XxREqcCtAxo6sEoPsZWOnR/tAzDt0zBumwWBQ=;
 b=T2AKCnMHoWUhliZhJiBJXRFfRfTUcIYQHY/1yRVorRWrEyjfcemZ1K/CEX6+SuUJ3MU3BqUZoMzHSySYdufKZUXHC7O5IHQJNhE44RovHu6Yl9rzg8B8Gs7A8EocomTI3D8pD1AuYZ//Na/NsT/ZERsDtRbuhdHFQuYgvGlSf/ASszg8nJZRpqij+K7+90rYrgkPSyobEHWw7UYOQMs5hqy3oGtGB7t8NxztIFqJ+tP/4A5ePiVGQGTC6F3yptcZBffU2dUbcLQtZwA3uIsnHl6nMYlx+wzoTyKIyCQYTzFgIxv8ZQDJATntGndolbIqBmo8T07H591PG+ZhFv1gPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3637.namprd12.prod.outlook.com (20.178.54.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 07:14:17 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa%6]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 07:14:17 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: avoid ras error injection for retired page
Thread-Topic: [PATCH] drm/amdgpu: avoid ras error injection for retired page
Thread-Index: AQHVd1x03AHNLWAbRUS7wbpwyyAdWqdDzTgw
Date: Mon, 30 Sep 2019 07:14:17 +0000
Message-ID: <BYAPR12MB2806F46A2E8DB7DAE48F15F0F1820@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190930065810.15372-1-tao.zhou1@amd.com>
In-Reply-To: <20190930065810.15372-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7c7b8b6-bc67-4e25-157d-08d74575ce79
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3637:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3637EF43049AA55180070685F1820@BYAPR12MB3637.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(189003)(199004)(13464003)(186003)(6506007)(316002)(305945005)(64756008)(26005)(53546011)(66476007)(66556008)(55016002)(486006)(66446008)(25786009)(102836004)(66946007)(229853002)(66066001)(6436002)(76116006)(476003)(446003)(11346002)(14444005)(5660300002)(256004)(6636002)(110136005)(7736002)(52536014)(71190400001)(74316002)(71200400001)(6246003)(86362001)(33656002)(9686003)(14454004)(8936002)(81166006)(81156014)(3846002)(6116002)(8676002)(99286004)(478600001)(2501003)(2906002)(76176011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3637;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ejt2IkKZyIQunqsPlher0iltebV8efHgTjoxWJ1MhjgJkbb+pxPSZ+MivuzBAklHNwhIBT6seyfauf9V7gXOJ1DIz0fih+3EWoepQ7ga+Lpij2VZrYjQZOJ0ezJ7kXwIn36jrScL6+GT4ILuG+S+Oufpivo/ONWTBRNwJiZD1Dw2quA2jzM/eK9ntH+OFU9PiaAWowA1SldLDOhLvEbPEIGDaOne+U7iXIzTSwEMTfqEyoUqMwk9gJCyiqSDnV2IqzZbINL1JqtJNIWkLebn0vY8/oJ3K7Xpo30ZjoTIeIYILjwUxySbiCkcqE1YcrQ6QcLXWbkJlHqSm84dfNJDyS9QvU2VNFqc6WeLtUjvkRHGy541SHbELZbtvpG/r9YSySN12Gg9cvN2VKkCcg8kRc2NUww4S6uFYIsl1ji+tDk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c7b8b6-bc67-4e25-157d-08d74575ce79
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 07:14:17.1737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oA3AQuAaEIxicI6fMf0K0PPTEA1fRYmF6dS0kQ4wG4WHdyfHvT2V5PazLBbRXdItDIfd1CLsygp5WgR6fXs0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3637
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXP282XxREqcCtAxo6sEoPsZWOnR/tAzDt0zBumwWBQ=;
 b=YXFmWZ+lH4hmhhw046j7g/0Gvl0fqTZDyZFxq/TuXEsNwK5a51wI5zTX3wjQcRU3S9dn71Dcoc3okih6t70Omk65yiWhUE+cxrPtpdJnb6zhbMge7AgDXM5xXqGULnnuq5H6QC8yjKOD0y20i3/3Ik2F9WhtWvw4RhEY81X5rd0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgoKUmVnYXJkcywKR3VjaHVuCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBaaG91
MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4gClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAy
MDE5IDI6NTggUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBHdWNo
dW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPgpDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+ClN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZGdwdTogYXZvaWQgcmFzIGVycm9yIGluamVjdGlvbiBmb3IgcmV0aXJlZCBwYWdl
CgpjaGVjayB3aGV0aGVyIGEgcGFnZSBpcyBiYWQgcGFnZSBiZWZvcmUgZXJyb3IgaW5qZWN0aW9u
CgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMzggKysrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggZmUzYTU3ZTU2N2M4Li5kNTBlNTY1YjBiMjAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTcxLDYgKzcxLDkg
QEAgY29uc3QgY2hhciAqcmFzX2Jsb2NrX3N0cmluZ1tdID0gewogCiBhdG9taWNfdCBhbWRncHVf
cmFzX2luX2ludHIgPSBBVE9NSUNfSU5JVCgwKTsKIAorc3RhdGljIGJvb2wgYW1kZ3B1X3Jhc19j
aGVja19iYWRfcGFnZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQl1aW50NjRfdCBh
ZGRyKTsKKwogc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX3JlYWQoc3RydWN0IGZp
bGUgKmYsIGNoYXIgX191c2VyICpidWYsCiAJCQkJCXNpemVfdCBzaXplLCBsb2ZmX3QgKnBvcykK
IHsKQEAgLTI5MCw2ICsyOTMsMTMgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X3Jhc19kZWJ1Z2Zz
X2N0cmxfd3JpdGUoc3RydWN0IGZpbGUgKmYsIGNvbnN0IGNoYXIgX191c2VyICoKIAkJCWJyZWFr
OwogCQl9CiAKKwkJLyogY2UvdWUgZXJyb3IgaW5qZWN0aW9uIGZvciBhIGJhZCBwYWdlIGlzIG5v
dCBhbGxvd2VkICovCisJCWlmIChhbWRncHVfcmFzX2NoZWNrX2JhZF9wYWdlKGFkZXYsIGRhdGEu
aW5qZWN0LmFkZHJlc3MpKSB7CisJCQlEUk1fV0FSTigiRFJNIFdBUk46IDB4JWxseCBoYXMgYmVl
biBtYXJrZWQgYXMgYmFkIGJlZm9yZSBlcnJvciBpbmplY3Rpb24hXG4iLAorCQkJCQlkYXRhLmlu
amVjdC5hZGRyZXNzKTsKKwkJCWJyZWFrOworCQl9CisKIAkJLyogZGF0YS5pbmplY3QuYWRkcmVz
cyBpcyBvZmZzZXQgaW5zdGVhZCBvZiBhYnNvbHV0ZSBncHUgYWRkcmVzcyAqLwogCQlyZXQgPSBh
bWRncHVfcmFzX2Vycm9yX2luamVjdChhZGV2LCAmZGF0YS5pbmplY3QpOwogCQlicmVhazsKQEAg
LTE0MzAsNiArMTQ0MCwzNCBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfbG9hZF9iYWRfcGFnZXMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAorLyogY2hlY2sg
aWYgYW4gYWRkcmVzcyBiZWxvbmdzIHRvIGJhZCBwYWdlICovIHN0YXRpYyBib29sIAorYW1kZ3B1
X3Jhc19jaGVja19iYWRfcGFnZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQl1aW50
NjRfdCBhZGRyKQoreworCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9j
b250ZXh0KGFkZXYpOworCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0YTsKKwlpbnQg
aSwgcmV0ID0gZmFsc2U7CltHdWNodW5dSXQncyBiZXR0ZXIgdG8gdXNlIGJvb2wgdHlwZSBmb3Ig
dGhlIHJldCB2YXJpYWJsZSwgdG8ga2VlcCBjb25zaXN0ZW50IHdpdGggZnVuY3Rpb24gcmV0dXJu
IHR5cGU/CkFwYXJ0IGZyb20gdGhhdCwgdGhpcyBwYXRjaCBpczogUmV2aWV3ZWQtYnk6IEd1Y2h1
biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgoKKworCWlmICghY29uIHx8ICFjb24tPmVoX2Rh
dGEpCisJCXJldHVybiByZXQ7CisKKwltdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2spOwor
CWRhdGEgPSBjb24tPmVoX2RhdGE7CisJaWYgKCFkYXRhKQorCQlnb3RvIG91dDsKKworCWFkZHIg
Pj49IEFNREdQVV9HUFVfUEFHRV9TSElGVDsKKwlmb3IgKGkgPSAwOyBpIDwgZGF0YS0+Y291bnQ7
IGkrKykKKwkJaWYgKGFkZHIgPT0gZGF0YS0+YnBzW2ldLnJldGlyZWRfcGFnZSkgeworCQkJcmV0
ID0gdHJ1ZTsKKwkJCWdvdG8gb3V0OworCQl9CisKK291dDoKKwltdXRleF91bmxvY2soJmNvbi0+
cmVjb3ZlcnlfbG9jayk7CisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIHZvaWQgYW1kZ3B1X3Jh
c19jcmVhdGVfYmFkX3BhZ2VzX2JvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgewogCS8q
IE5vdGU6IHRoZSBjYWxsZXIgc2hvdWxkIGd1YXJhbnRlZSBjb24gYW5kIGRhdGEgYXJlIG5vdCBO
VUxMICovCi0tCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
