Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA098C024
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 20:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AF96E220;
	Tue, 13 Aug 2019 18:08:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACB46E220
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 18:08:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grd+Cw2CYV7AxnRzF6WXenGvWs1rt9JvVk6tShg6a+nalOYJa0J2zPQ7tm2Qlg3/sDEXbTswDtWhqSUZIPgeNXYxCm+8zHfUkqulk4ElKQqLTWdFleHK2Lnlnpk8G0qGB22GGZmy9zc0UcRalza4vjlQUeFDG2KcJ67cmKbvlv7zTa48ceC8VWY57ucFjsr2ou8xwfYgeynI4NbGIz7npxDCxdfIqfI4BYFK02qq3kXrg0p+9vS4fXu7XCLbBEs5Coc0bekzG5+W6hKZDrA6AHdNmvOxIX/rwCnEJqz6bKUL4AlXl87HcZNKPl3XOEMFY7tOhJP43i/1+4bFXptIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bOI0Tnk0poYGr2iaWjbZ0uaWZn2hLnJo8jxdQlrI1c=;
 b=ceFhDTLC27FMSvDG+0LyA1jmwaviixjfkpn92vyN0eKme2YBkXIyD+PRKO0sZI4DJwLOoV/KvOwDJt781DhPFLXw+5FOJcTT53Y+3zSeRtSGNmX4rJ5gHkSU8OiPItJRrtb/m7NgEloprIIcW9s+S9ZGLex/7s+J7n1DwQys/SxXwlkqpZyuAerEbln+JhpGTbNgyfzyTlxaUXpC1gITyCBfvJJJrntihwwfF+VMGDj7vC7ipYn6K8zqm4yCq3too1IsslEgKIH/UHWqErJj2EPRZmaD5yzBivAD1NZP23m21gubBSPkb3LV9XIUnyNAEWnxGxqMWqbEBcuHiGfyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3081.namprd12.prod.outlook.com (20.178.30.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 18:08:04 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 18:08:04 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Add more page fault info printing for GFX10
Thread-Topic: [PATCH 2/2] drm/amdgpu: Add more page fault info printing for
 GFX10
Thread-Index: AQHVUgINnaMPT8OiFUq7n0MIjdKbXg==
Date: Tue, 13 Aug 2019 18:08:04 +0000
Message-ID: <20190813180744.10901-2-Yong.Zhao@amd.com>
References: <20190813180744.10901-1-Yong.Zhao@amd.com>
In-Reply-To: <20190813180744.10901-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64ee4bc5-e42c-41fc-5e5f-08d720192fdb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3081; 
x-ms-traffictypediagnostic: DM6PR12MB3081:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB308145F241F1EBD67E362E62F0D20@DM6PR12MB3081.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:125;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(256004)(316002)(66446008)(66556008)(36756003)(66476007)(66946007)(64756008)(5640700003)(5660300002)(6436002)(8936002)(81156014)(81166006)(50226002)(486006)(6916009)(446003)(476003)(11346002)(2616005)(7736002)(6486002)(305945005)(2501003)(86362001)(2351001)(6116002)(6512007)(53936002)(26005)(25786009)(186003)(4326008)(3846002)(102836004)(76176011)(99286004)(6506007)(386003)(52116002)(478600001)(66066001)(2906002)(14454004)(71190400001)(71200400001)(1076003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3081;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eT11syQsHp43bcztegRsm/WQ0s4H70X3cGeKmiPUUSbaIAHWC27uT9xsSfVegioDeQpU4SxK2Q1Cco6QwWxIP0jr9xlnZY5ngw+fm2edxkjmozV7EtjNkjal8uWXiGhu8V68c7f1iKdUFDYtvkoBA3QI2FLwNMqhpg1m4mqigLIzIvBp6n34ujlCVmB2en0SFvGWiVZMIzQHP6yWtfWjeqEkB0AoBqMD097EOhTRTep+0U5Wt3sNb/aGJVAa6ciFyuhYKmm6dGB5BD+URSqRgmkjBQ6Gsd+W4kJ33RstADUX5ASeSMDuVoBBcpJd5dE0auHKhbZ5+IaMGximXoeDe0DHVjZPFPC4rNOcSJK9WKLNryW4LogtMFQGcDSSHqWok0AMKsc7qMi5/NYxWLAbiGDoMtZSpvqvAaT3MFU1Yzc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ee4bc5-e42c-41fc-5e5f-08d720192fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 18:08:04.7410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGx3k1bl8iLOznPcUmUFqzEWdFjHNfnKMbwr2o4dRxVVg4gqcCm6eS/BUvl5tNlB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3081
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bOI0Tnk0poYGr2iaWjbZ0uaWZn2hLnJo8jxdQlrI1c=;
 b=uQ+xhUiWydmlliZY+HNhonK8ulLElfUp2J05ig92MJC7/L391gxgpAd495C4JFnvWKhI3L87N/nCsaPTU8JlX1MGUZyuaOMEtAvFMy7Qp7AoBe/dDW7yGLzozffBerTSXTjd8CkXPj4XYttrrD3FUE2CGGNu+5XAlNI/w+Kj4KQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHByaW50aW5nIHdlIGRpZCBmb3IgR0ZYOSB3YXMgbm90IHByb3BvZ2F0ZWQgdG8gR0ZYMTAg
c29tZWhvdywgc28gZml4Cml0IG5vdy4KCkNoYW5nZS1JZDogSWMwYjgzODExMzQzNDBiODNjZDY5
YzNmZTE4NmFjN2E4YTk3YjFiY2EKU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9A
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyB8IDMz
ICsrKysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
CmluZGV4IDRlM2FjMTA4NGE5NC4uZWFkMmQzYmY4YThkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjEwXzAuYwpAQCAtMTQwLDE3ICsxNDAsNDAgQEAgc3RhdGljIGludCBnbWNfdjEw
XzBfcHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJfQogCiAJ
aWYgKHByaW50a19yYXRlbGltaXQoKSkgeworCQlzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyB0YXNr
X2luZm87CisKKwkJbWVtc2V0KCZ0YXNrX2luZm8sIDAsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Rh
c2tfaW5mbykpOworCQlhbWRncHVfdm1fZ2V0X3Rhc2tfaW5mbyhhZGV2LCBlbnRyeS0+cGFzaWQs
ICZ0YXNrX2luZm8pOworCiAJCWRldl9lcnIoYWRldi0+ZGV2LAotCQkJIlslc10gVk1DIHBhZ2Ug
ZmF1bHQgKHNyY19pZDoldSByaW5nOiV1IHZtaWQ6JXUgcGFzaWQ6JXUpXG4iLAorCQkJIlslc10g
cGFnZSBmYXVsdCAoc3JjX2lkOiV1IHJpbmc6JXUgdm1pZDoldSBwYXNpZDoldSwgIgorCQkJImZv
ciBwcm9jZXNzICVzIHBpZCAlZCB0aHJlYWQgJXMgcGlkICVkKVxuIiwKIAkJCWVudHJ5LT52bWlk
X3NyYyA/ICJtbWh1YiIgOiAiZ2Z4aHViIiwKIAkJCWVudHJ5LT5zcmNfaWQsIGVudHJ5LT5yaW5n
X2lkLCBlbnRyeS0+dm1pZCwKLQkJCWVudHJ5LT5wYXNpZCk7Ci0JCWRldl9lcnIoYWRldi0+ZGV2
LCAiICBhdCBwYWdlIDB4JTAxNmxseCBmcm9tICVkXG4iLAorCQkJZW50cnktPnBhc2lkLCB0YXNr
X2luZm8ucHJvY2Vzc19uYW1lLCB0YXNrX2luZm8udGdpZCwKKwkJCXRhc2tfaW5mby50YXNrX25h
bWUsIHRhc2tfaW5mby5waWQpOworCQlkZXZfZXJyKGFkZXYtPmRldiwgIiAgaW4gcGFnZSBzdGFy
dGluZyBhdCBhZGRyZXNzIDB4JTAxNmxseCBmcm9tIGNsaWVudCAlZFxuIiwKIAkJCWFkZHIsIGVu
dHJ5LT5jbGllbnRfaWQpOwotCQlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkKKwkJaWYgKCFh
bWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKIAkJCWRldl9lcnIoYWRldi0+ZGV2LAotCQkJCSJWTV9M
Ml9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUzoweCUwOFhcbiIsCisJCQkJIkdDVk1fTDJfUFJPVEVD
VElPTl9GQVVMVF9TVEFUVVM6MHglMDhYXG4iLAogCQkJCXN0YXR1cyk7CisJCQlkZXZfZXJyKGFk
ZXYtPmRldiwgIlx0IE1PUkVfRkFVTFRTOiAweCVseFxuIiwKKwkJCQlSRUdfR0VUX0ZJRUxEKHN0
YXR1cywKKwkJCQlHQ1ZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBNT1JFX0ZBVUxUUykp
OworCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBXQUxLRVJfRVJST1I6IDB4JWx4XG4iLAorCQkJ
CVJFR19HRVRfRklFTEQoc3RhdHVzLAorCQkJCUdDVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFU
VVMsIFdBTEtFUl9FUlJPUikpOworCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBQRVJNSVNTSU9O
X0ZBVUxUUzogMHglbHhcbiIsCisJCQkJUkVHX0dFVF9GSUVMRChzdGF0dXMsCisJCQkJR0NWTV9M
Ml9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUywgUEVSTUlTU0lPTl9GQVVMVFMpKTsKKwkJCWRldl9l
cnIoYWRldi0+ZGV2LCAiXHQgTUFQUElOR19FUlJPUjogMHglbHhcbiIsCisJCQkJUkVHX0dFVF9G
SUVMRChzdGF0dXMsCisJCQkJR0NWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUywgTUFQUElO
R19FUlJPUikpOworCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBSVzogMHglbHhcbiIsCisJCQkJ
UkVHX0dFVF9GSUVMRChzdGF0dXMsCisJCQkJR0NWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRV
UywgUlcpKTsKKwkJfQogCX0KIAogCXJldHVybiAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
