Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325B9A624
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 05:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EB06EBB0;
	Fri, 23 Aug 2019 03:42:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730067.outbound.protection.outlook.com [40.107.73.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D016EBB0
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 03:42:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaHqZQu1bJeKcGimQurz/ywvpSmPeQLmMnn5nkVSf03NKySukzf2OXTeal2C2HPCZlcIWvQ3VKGae6pN52unfCFO3N0Pm9eI0vSryoRF4EdAQ9d9I/y/P57VWN0YruQbEli1rUNtuY93hipHg5cn/ws/x29bCFxRCpy3te/FVf81uVRM5ms1z+U1hUvS2dy9jaVLQebYuS0v/rfOeDlgDPd3spy+GhoToxvDbfztXZi+6CXIxQFkJbxGBJ0QwlCMoEt4q2tCEBP6SDYGqcUSjDaPYVyHEkPz7L2leSATrx7eQ0tkbKprp2hM4ZAFr27KQPNFx7x4L2PKP8YmlD4SiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J4uAqndYzEWL0MHs0JKA0mNAcjBfxk05T9VjKt52nI=;
 b=cSng5gQvlpYTULBHTVrRFFe+0x/0ibhzIHlkVKFTc5r2SYx15XY5e7Fpn7559XS+iz4ZZ8+jEql2CkJmbjUH1/0e8BZgouSTAgIsSaGO7I8wV+s5aesnPkCoWApGY3hlWWkL0THPxMdJNbF6jZHjjG4xQ/Y9R6YUQyWobN6qXZ0GIXjc6wm1DnTGM3/iNOHY19h4xFh1JiMiYf/7xfpTv0cXxkX8JO6iqLZaCsU7DwcvLRRMLKsyQ1Gzl9ygZiZYH2GUKX762MHxJWUaBgG4A96CmSVAO8LHkpolzpZntXKkQr9nfVSbZ7hGWZST+KjXQrrUed6/Ljr1eYj8xtvW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4141.namprd12.prod.outlook.com (52.135.49.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 03:42:08 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 03:42:08 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu/display: add flag for multi-display mclk
 switching
Thread-Topic: [PATCH 4/4] drm/amdgpu/display: add flag for multi-display mclk
 switching
Thread-Index: AQHVWSAq8isHyDFiz0ypQLc/nzl/zKcIFu7Q
Date: Fri, 23 Aug 2019 03:42:07 +0000
Message-ID: <MN2PR12MB3344AD39A67AE87ABEC29594E4A40@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190822193050.3107-1-alexander.deucher@amd.com>
 <20190822193050.3107-5-alexander.deucher@amd.com>
In-Reply-To: <20190822193050.3107-5-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79028fb4-fb62-462c-fd2a-08d7277bdf8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4141; 
x-ms-traffictypediagnostic: MN2PR12MB4141:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB41411CC0A26BF25189048C4FE4A40@MN2PR12MB4141.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(13464003)(199004)(189003)(86362001)(478600001)(76176011)(74316002)(14444005)(55016002)(305945005)(229853002)(6506007)(52536014)(71200400001)(6436002)(4326008)(25786009)(6246003)(256004)(7696005)(99286004)(81166006)(14454004)(2906002)(76116006)(102836004)(7736002)(53546011)(5660300002)(53936002)(8936002)(6306002)(9686003)(81156014)(8676002)(966005)(476003)(66476007)(66946007)(33656002)(11346002)(71190400001)(446003)(6116002)(3846002)(110136005)(66446008)(316002)(486006)(66066001)(26005)(2501003)(64756008)(66556008)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4141;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DV+OgjjqIojPaWkoaZ60mmXyiSZJYBHgJrCGjuQtlFD6/HY1i/TA5lVhaiL2Kre9cDK5cHnlJfU0NLroKH6VW0CV+zQZkPOqJYwtQt7pKxW+c4EsOg9T/7R1PXfpmXcJulYoKtNs5zwxgIfjTim4WbOW4tHXZ6mkwV58K0U12CnPz6QnylPkaBP0WR4UVOsoa5Li8UEF1RdHNfZeyDyBF/QP2kMJkN+HvAc3Z0Xc9rT2AlOm+4M0Dsb9dfqRMQTUHa807BIWkSe37TLoxSDCt7fkNusoVMCs/rJZF9AjtW4GRLaCj388X6m3u8B/+NqmRQ+911VUyYXLd0TmSHj3Muo0GLFqd+6amUfoT43VD2iIg1B5zazOB6Nmti/A/Noq5hkYnzJjwybWwSUX8wOydn2ao7ID2xNWQB81l3VB4xc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79028fb4-fb62-462c-fd2a-08d7277bdf8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 03:42:07.9322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lJ//zqg43h6lshn3l9GMnqvJpiF+HzX559NEiov098+jI12U+vdXPE5eGILQHu1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J4uAqndYzEWL0MHs0JKA0mNAcjBfxk05T9VjKt52nI=;
 b=gnPewYPGCfJ8bP1nVnubjcXpHDa8yCmXXnh1ISlbCd1W4MggAcljZ6mPQrvmvZhbR/le/WXSbazblldH0sx+0fNcaUBIKYX1XnK5fbEZwM26MSDzVFq76CITy9JiDbKOyuFV6DREZ0km01jhRQuYv6rPXta5khS2LrFFkEULxKc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2gxLCAyIGFyZSByZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4N
ClBhdGNoIDMsNCBhcmUgYWNrZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hl
cg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyMywgMjAxOSAzOjMxIEFNDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNC80XSBkcm0vYW1kZ3B1L2Rp
c3BsYXk6IGFkZCBmbGFnIGZvciBtdWx0aS1kaXNwbGF5IG1jbGsNCj4gc3dpdGNoaW5nDQo+IA0K
PiBBZGQgYSBkY2ZlYXR1cmVtYXNrIGZsYWcgZm9yIG1jbGsgc3dpdGNoaW5nLiAgRGlzYWJsZSBi
eSBkZWZhdWx0OyBlbmFibGUgb25jZQ0KPiB0aGUgZmVhdHVyZSBoYXMgc2VlbiBtb3JlIHRlc3Rp
bmcuDQo+IA0KPiBTZXQgYW1kZ3B1LmRjZmVhdHVyZW1hc2s9MiBvbiB0aGUga2VybmVsIGNvbW1h
bmQgbGluZSBpbiBncnViIHRvIGVuYWJsZQ0KPiB0aGlzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzICsrKw0KPiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMgIHwgNSArKysr
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgICAgICB8
IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmggICAgICAg
ICAgfCAxICsNCj4gIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4IDQ1Mjk4MjY5NzQ0ZC4uY2I4NmNjZjQ4YmQ5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMNCj4gQEAgLTY5NCw2ICs2OTQsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2KQ0KPiAgCWlmIChhbWRncHVfZGNfZmVhdHVyZV9t
YXNrICYgRENfRkJDX01BU0spDQo+ICAJCWluaXRfZGF0YS5mbGFncy5mYmNfc3VwcG9ydCA9IHRy
dWU7DQo+IA0KPiArCWlmIChhbWRncHVfZGNfZmVhdHVyZV9tYXNrICYNCj4gRENfTVVMVElfTU9O
X1BQX01DTEtfU1dJVENIX01BU0spDQo+ICsJCWluaXRfZGF0YS5mbGFncy5tdWx0aV9tb25fcHBf
bWNsa19zd2l0Y2ggPSB0cnVlOw0KPiArDQo+ICAJaW5pdF9kYXRhLmZsYWdzLnBvd2VyX2Rvd25f
ZGlzcGxheV9vbl9ib290ID0gdHJ1ZTsNCj4gDQo+ICAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENf
RENOMl8wDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2Fs
Y3MvZGNlX2NhbGNzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNlX2NhbGNzLmMNCj4gaW5kZXggZWNhNjgxZDlkN2Y1Li5hMWQ0OTI1NmZhYjcgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMN
Cj4gQEAgLTMwMjUsNyArMzAyNSwxMCBAQCBib29sIGJ3X2NhbGNzKHN0cnVjdCBkY19jb250ZXh0
ICpjdHgsDQo+IA0KPiAgCXBvcHVsYXRlX2luaXRpYWxfZGF0YShwaXBlLCBwaXBlX2NvdW50LCBk
YXRhKTsNCj4gDQo+IC0JY2FsY3Nfb3V0cHV0LT5hbGxfZGlzcGxheXNfaW5fc3luYyA9IGFsbF9k
aXNwbGF5c19pbl9zeW5jKHBpcGUsDQo+IHBpcGVfY291bnQpOw0KPiArCWlmIChjdHgtPmRjLT5j
b25maWcubXVsdGlfbW9uX3BwX21jbGtfc3dpdGNoKQ0KPiArCQljYWxjc19vdXRwdXQtPmFsbF9k
aXNwbGF5c19pbl9zeW5jID0NCj4gYWxsX2Rpc3BsYXlzX2luX3N5bmMocGlwZSwgcGlwZV9jb3Vu
dCk7DQo+ICsJZWxzZQ0KPiArCQljYWxjc19vdXRwdXQtPmFsbF9kaXNwbGF5c19pbl9zeW5jID0g
ZmFsc2U7DQo+IA0KPiAgCWlmIChkYXRhLT5udW1iZXJfb2ZfZGlzcGxheXMgIT0gMCkgew0KPiAg
CQl1aW50OF90IHljbGtfbHZsLCBzY2xrX2x2bDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjLmgNCj4gaW5kZXggM2VmMjY5ZjgyNDc4Li41ZDRhMmE5MjI4ZjAgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oDQo+IEBAIC0yMjAsNyArMjIwLDcgQEAgc3RydWN0
IGRjX2NvbmZpZyB7DQo+ICAJYm9vbCBwb3dlcl9kb3duX2Rpc3BsYXlfb25fYm9vdDsNCj4gIAli
b29sIGVkcF9ub3RfY29ubmVjdGVkOw0KPiAgCWJvb2wgZm9yY2VkX2Nsb2NrczsNCj4gLQ0KPiAr
CWJvb2wgbXVsdGlfbW9uX3BwX21jbGtfc3dpdGNoOw0KPiAgfTsNCj4gDQo+ICBlbnVtIHZpc3Vh
bF9jb25maXJtIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9h
bWRfc2hhcmVkLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5o
DQo+IGluZGV4IGEwYTcyMTE0MzhmMi4uODg4OWFhY2VlYzYwIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgNCj4gQEAgLTE0Miw2ICsxNDIsNyBAQCBlbnVt
IFBQX0ZFQVRVUkVfTUFTSyB7DQo+IA0KPiAgZW51bSBEQ19GRUFUVVJFX01BU0sgew0KPiAgCURD
X0ZCQ19NQVNLID0gMHgxLA0KPiArCURDX01VTFRJX01PTl9QUF9NQ0xLX1NXSVRDSF9NQVNLID0g
MHgyLA0KPiAgfTsNCj4gDQo+ICBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsOw0KPiAtLQ0KPiAy
LjIwLjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
