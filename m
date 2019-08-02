Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3267EC7A
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 08:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE976ECC3;
	Fri,  2 Aug 2019 06:12:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720064.outbound.protection.outlook.com [40.107.72.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76226ECC3
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 06:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhBtYtC27m+46j1AA5iuFoAQS0VqLy/8723O7PrewnratgFdCwJ3vuzrTERFEhibRDBTqDkPIKAwJtoEtOLgZ8b4QHV2oEcQR/kwS8ojJGjlnheO/hXfGMM9fj6HAOVjqBPBUzkF3S5cJCWEsU7UASKpQzVOnSqGphddLThotaaJ3eiNF/ry0ws8penko81am1qqHNHrP3nMn2hK+/EJ9fftQzN+WItwtcgdMDMcQjtb66mj7+yTEpVWs59tB+HbkV7yZN5FnorsKnrk9InY9p1v5VTFZVJqlOOkJ5q4FjbVi2aiBKy0wM9YpQrsti0CBR0OGMt4ypUzbtu59494AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+bpMWsoo8MpbCejiJc2ncDFoQCVQVkCAQ0chvu94sU=;
 b=ESd9WTvKxkEh/JQ4V+O5PMOMN9Px9K8Qe/nmpQjmoQRKhI9SfYLH703fes1ZwiQUM8dFxQfF0N3+P0ZA/1Pe4IKkikWmrxROkmK9Cz/8lHva89Akp04KUBoH4RkOXNzyD+XDNtS/nyM204FU8T19kTdlRTE1MKdA2sG7EE2NGL+0nRi3QL2ESRYFUJB2eCK5oC0hHdJ8GNto6PU/bQCEVhcnzTiGSqrTk3Fk/pXWQg8JTH6WoiCtsuz3U6MzKbFDybrCfgAFC0lQP90oP7SGbRueqoOjzLHMXBrFxTtKLDIGlbvJxKNDXpa/n8WTl9GXKHzQDaTpoX7pIoIAKr3HJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3217.namprd12.prod.outlook.com (20.179.65.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 06:12:05 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 06:12:05 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Gao, Likun" <Likun.Gao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Topic: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Index: AQHVSPJsC2yQl3q1iEK/RaZjyAFhGqbnXigm
Date: Fri, 2 Aug 2019 06:12:05 +0000
Message-ID: <BN8PR12MB3602D2293EFA72B3A3545EE389D90@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <1564723334-18375-1-git-send-email-likun.gao@amd.com>
In-Reply-To: <1564723334-18375-1-git-send-email-likun.gao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d08a14e-3152-4a2b-47cc-08d7171057eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3217; 
x-ms-traffictypediagnostic: BN8PR12MB3217:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB32174C57D9E48EAEA2BF709389D90@BN8PR12MB3217.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:389;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(189003)(199004)(486006)(11346002)(52536014)(446003)(53546011)(6506007)(54906003)(110136005)(476003)(5660300002)(316002)(26005)(99286004)(966005)(76176011)(102836004)(6246003)(4326008)(33656002)(6116002)(25786009)(186003)(14454004)(55016002)(478600001)(9686003)(3846002)(7736002)(86362001)(2501003)(8936002)(81166006)(81156014)(8676002)(6306002)(6436002)(229853002)(66066001)(2906002)(256004)(66946007)(91956017)(74316002)(14444005)(76116006)(64756008)(66556008)(71190400001)(68736007)(71200400001)(305945005)(66476007)(66446008)(53936002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3217;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0+XshEHXF+Bf9CpzTFaYNtQiHlY6TP/236/LNrbqaNUrpHP9V6lMwP3ikEONGI3B74dn+gdpmx3O2okkwrc/Q8crEloseONylswOzcy1ZoXoLhbzIEYMPOnQkpu3lYe3OyFA6NIn6wk34d1jK5gS0PflYOkMc3ohSTNusnNwH1whkMpqiuaPJ80AuBKgewxPqe0xV4hFw3D/9PQVxz9leVyAgcV3evTeNFaJVZY5ESk27YhTAtFnv2v6CpW9/HWDzIdXLO22CbyV6NXDPf0Yfs1ESn6JKV7FgAv/LwZC3k7768CvmfvgSOsZLByHGTnk3DVC8QCJujNGURgWv4sreZ4csJdPl+9dHGM3TrVsdIlrQDbjNbU5jRXfVROGTfAhRGXJl+UJhF6wHOxpURCbYLq5z58nkJIJHgcgaAM74OQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d08a14e-3152-4a2b-47cc-08d7171057eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 06:12:05.7327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3217
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+bpMWsoo8MpbCejiJc2ncDFoQCVQVkCAQ0chvu94sU=;
 b=TeAVk+iOMM9bWMZsuL7/OrWm7ROx/ka8VTN5Uv+x9q3vWXfnjnBXZoxcE5ynfVuiXy7GQV/hMAkdumRIejRvphowH65k1eOGu91aNyru+7SecmabR6tSSNasMpQzX8Y9sgNEa86oDCNVzSkfL7yX7J9cPJIkX9ZJB+ZqM27yP1Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Paul Gover <pmw.gover@yahoo.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgTGlrdW4sCgpMb29rcyBsaWtlIHlvdSBjYW4gcGluIGNzYiBidWZmZXIgQGdmeF92OF8wX2h3
X2luaXQoKSBqdXN0IGxpa2Ugd2hhdCBmb2xsb3dpbmcgcGF0Y2ggZG9lcyBmb3IgZ2Z4OSwgc28g
dGhhdCB3ZSBjYW4gc3RpbGwgdXNlIHRoZSBjb21tb24gZnVuY3Rpb24gYW1kZ3B1X2dmeF9ybGNf
aW5pdF9jc2IoKToKCmNvbW1pdCAxMzdkYzRiOTA2MGU5OWEyMmRjZTU5YjQyY2E3MTkxMmNmMDE4
MGYzCkF1dGhvcjogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KRGF0ZTogICBXZWQgSnVs
IDQgMTY6MjE6NTIgMjAxOCArMDgwMAoKICAgIGRybS9hbWRncHU6IHBpbiB0aGUgY3NiIGJ1ZmZl
ciBvbiBodyBpbml0IHYyCgogICAgV2l0aG91dCB0aGlzIHBpbiwgdGhlIGNzYiBidWZmZXIgd2ls
bCBiZSBmaWxsZWQgd2l0aCBpbmNvbnNpc3RlbnQKICAgIGRhdGEgYWZ0ZXIgUzMgcmVzdW1lLiBB
bmQgdGhhdCB3aWxsIGNhdXNlcyBnZnggaGFuZyBvbiBnZnhvZmYKICAgIGV4aXQgc2luY2UgdGhp
cyBjc2Igd2lsbCBiZSBleGVjdXRlZCB0aGVuLgoKICAgIHYyOiBmaXQgYW1kZ3B1X2JvX3BpbiBj
aGFuZ2UodGFrZSBvbmUgbGVzcyBhcmd1bWVudCkKCiAgICBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1
YW4gPGV2YW4ucXVhbkBhbWQuY29tPgogICAgUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CgpCUiwKWGlhb2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBvbiBiZWhhbGYgb2YgbGlrdW4gR2FvIDxsaWt1bi5nYW9AYW1kLmNvbT4KU2Vu
dDogRnJpZGF5LCBBdWd1c3QgMiwgMjAxOSAxOjIyIFBNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpDYzogRGV1Y2hlciwgQWxleGFuZGVyOyBHYW8sIExpa3VuOyBQYXVsIEdvdmVy
ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogcmVtb3ZlIHVucGluIGNsZWFyX3N0YXRlX29i
aiBmb3IgZ2Z4IHY4CgpGcm9tOiBMaWt1biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPgoKUmVtb3Zl
IHVucGluIHJsYyBjbGVhcl9zdGF0ZV9vYmogZm9yIGdmeCB2OCB3aGVuIHJsYyBpbml0LAp3aGlj
aCB3aWxsIG1ha2UgU3RvbmV5IHBtX3N1c3BlbmQgaGFuZy4KClNpZ25lZC1vZmYtYnk6IExpa3Vu
IEdhbyA8TGlrdW4uR2FvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y4XzAuYyB8IDIyICsrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjhfMC5jCmluZGV4IGQyOTA3MTguLjBiNzNjNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y4XzAuYwpAQCAtMTI5Miw2ICsxMjkyLDggQEAgc3RhdGljIGludCBnZnhfdjhfMF9j
cF9qdW1wX3RhYmxlX251bShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKCiBzdGF0aWMgaW50
IGdmeF92OF8wX3JsY19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogeworICAgICAg
IHZvbGF0aWxlIHUzMiAqZHN0X3B0cjsKKyAgICAgICB1MzIgZHdzOwogICAgICAgIGNvbnN0IHN0
cnVjdCBjc19zZWN0aW9uX2RlZiAqY3NfZGF0YTsKICAgICAgICBpbnQgcjsKCkBAIC0xMzAwLDEw
ICsxMzAyLDI0IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfcmxjX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiAgICAgICAgY3NfZGF0YSA9IGFkZXYtPmdmeC5ybGMuY3NfZGF0YTsKCiAg
ICAgICAgaWYgKGNzX2RhdGEpIHsKLSAgICAgICAgICAgICAgIC8qIGluaXQgY2xlYXIgc3RhdGUg
YmxvY2sgKi8KLSAgICAgICAgICAgICAgIHIgPSBhbWRncHVfZ2Z4X3JsY19pbml0X2NzYihhZGV2
KTsKLSAgICAgICAgICAgICAgIGlmIChyKQorICAgICAgICAgICAgICAgLyogY2xlYXIgc3RhdGUg
YmxvY2sgKi8KKyAgICAgICAgICAgICAgIGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfc2l6ZSA9
IGR3cyA9IGFkZXYtPmdmeC5ybGMuZnVuY3MtPmdldF9jc2Jfc2l6ZShhZGV2KTsKKyAgICAgICAg
ICAgICAgIHIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIGR3cyAqIDQsIFBBR0Vf
U0laRSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFNREdQ
VV9HRU1fRE9NQUlOX1ZSQU0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmosCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9n
cHVfYWRkciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2
b2lkICoqKSZhZGV2LT5nZngucmxjLmNzX3B0cik7CisgICAgICAgICAgICAgICBpZiAocikgewor
ICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybihhZGV2LT5kZXYsICIoJWQpIGNyZWF0ZSBS
TEMgYyBibyBmYWlsZWRcbiIsIHIpOworICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfZ2Z4
X3JsY19maW5pKGFkZXYpOwogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcjsKKyAgICAg
ICAgICAgICAgIH0KKworICAgICAgICAgICAgICAgLyogc2V0IHVwIHRoZSBjcyBidWZmZXIgKi8K
KyAgICAgICAgICAgICAgIGRzdF9wdHIgPSBhZGV2LT5nZngucmxjLmNzX3B0cjsKKyAgICAgICAg
ICAgICAgIGFkZXYtPmdmeC5ybGMuZnVuY3MtPmdldF9jc2JfYnVmZmVyKGFkZXYsIGRzdF9wdHIp
OworICAgICAgICAgICAgICAgYW1kZ3B1X2JvX2t1bm1hcChhZGV2LT5nZngucmxjLmNsZWFyX3N0
YXRlX29iaik7CisgICAgICAgICAgICAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGFkZXYtPmdmeC5y
bGMuY2xlYXJfc3RhdGVfb2JqKTsKICAgICAgICB9CgogICAgICAgIGlmICgoYWRldi0+YXNpY190
eXBlID09IENISVBfQ0FSUklaTykgfHwKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
