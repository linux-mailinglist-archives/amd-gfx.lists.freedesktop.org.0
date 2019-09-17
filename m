Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C006EB47D6
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 09:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F57A6E328;
	Tue, 17 Sep 2019 07:04:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9E76E328
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 07:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8QfMJMYW2Shc/ntZWwEisdhJdtKZvZNg1Ojb/C3mFdvFZi+V66iLXQBgDVmlgc4SIyaskZujqfI355aotGSRtTvJoupaRAiqHqw0pHpOVQDwNyJZcdgcEQi8zKbqe3hE0zVsA5lgEUphcNubY1T6/lzVdjE5hAgxcu+Zye9hWPb+3n2w3iLXOpdGj+PwRJESmVC+XTKE4W4hgz7JrJyKSq54/HZTYcj67xXhbURV9VKnvvsnae0UcxeCXTgkTlHIAMA13VCIwAQmIzMOh6a3PEvC32P30OaPIALBGx7mrbC4DtDOnxR/Td7ZcOZICC7VIMCIjtvtK+cVS7grC+h2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpFLrRx3cN6rFh6ZbWjRbyWuV/HxgGyOgHGoTE4Ccxc=;
 b=ABrxhh8NhTmIcjwNdXvolRk06T70Ky804upE77GGxYICbRGMlvXPPblBXJtzz/fB64fbhY2BHknRzkrL46zhacisnKsf6VRKHBpKDb6Rd2CBRe4heKQOmGRAR9IdbX5OSScCmON+CBycEV1J2mr/RAgc4vxbNeizQIxV8mqfy9Ucul3y7+LVtkij2p+1DGfW0lbaL2o44JU9Zs/SEDENv8uLfeZ/8ulF4VLpThIL0B1YTqxEt0snC4OLbLXhPQ2DiDhmhh/AUki9TTMjRr0bDN0LJMTgzCSd1Tv/I7oxcrQxhpLWC0PIdZv79y06rFqRvrc3qIBDvZCoaGXOiRKUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3575.namprd12.prod.outlook.com (20.178.197.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Tue, 17 Sep 2019 07:04:32 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 07:04:32 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Topic: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Index: AQHVbSCpRnXut+ezvEiOIBHKn2ZPqqcvbkKggAACPRCAAAFkgA==
Date: Tue, 17 Sep 2019 07:04:32 +0000
Message-ID: <BYAPR12MB280612A6519D804C9DE042DBF18F0@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190917062458.29589-1-tao.zhou1@amd.com>
 <BYAPR12MB28060C4BE2088D071875ABB1F18F0@BYAPR12MB2806.namprd12.prod.outlook.com>
 <MN2PR12MB3054549648F8445590F7D41EB08F0@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3054549648F8445590F7D41EB08F0@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1049a0f3-0e60-4f87-d41e-08d73b3d4a68
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3575; 
x-ms-traffictypediagnostic: BYAPR12MB3575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3575F19B6271036AF43C8E31F18F0@BYAPR12MB3575.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(13464003)(199004)(189003)(7696005)(81156014)(14444005)(52536014)(256004)(14454004)(86362001)(446003)(5660300002)(8936002)(81166006)(66066001)(110136005)(64756008)(6246003)(66446008)(66476007)(11346002)(66556008)(486006)(66946007)(2501003)(229853002)(76116006)(6636002)(476003)(25786009)(99286004)(33656002)(498600001)(2906002)(55016002)(6506007)(6116002)(3846002)(7736002)(74316002)(102836004)(6436002)(76176011)(71190400001)(53546011)(71200400001)(305945005)(9686003)(186003)(26005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3575;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eD9fUtTnI/VgZ1/6HuviAT3fSBZ7+S77vDg/C2gLKsABomo2Dz1bIiGEXeL2XqOPNE3SsxmrRQyxDdPnQrSTptkRLQYvlprkojQjKEXKggX70Ecuu0+J8zlvRzHUn6sbtjfOqpvkIKZZBcgnrRfQv/LsrlsSn0eABvf/Vlo0+1pjQeCRMbVrIlVcUyPp2tco/pHbRLSd2hO/HQLZ3sTc+WDQNB3iVSW0d1vI+UaB7bvI85WQiVWBNZnQq/loKeuIBStHaVNRpFiwNjI4b6FPo+1S8QhCEWCBrheyLhAEGT9MhR+rMGKO42R2qOxWnfErhakYlGhYO2/2GqA/TrXCsVRcrPyY7/VTe4ud+CcTpD84UIgGTr6W98qxwiZ3vUCxt2TDWKLOOa+29Anro0Mc2e5hd1NrEaSKTJApsq7ovtQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1049a0f3-0e60-4f87-d41e-08d73b3d4a68
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 07:04:32.1773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcdbbRwweOkDKA9QC59MVl8560ihXyX+DGJSRi5zGgdJXeu3Olg4Fw8yFmn6NQmwnC32Rp1OEFxfNsVeVq2ZKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3575
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpFLrRx3cN6rFh6ZbWjRbyWuV/HxgGyOgHGoTE4Ccxc=;
 b=o4UBu6GEtV+8mUFnF14habug8UfLoWWHyJ86uDJ4ag2px1CpyeQbhPZbuk9lsZyjoWSqVIYc47ZaojWjad4H4Kd5kDMO3EK2IcDlK3zdTh6ay68EEx9urgYPcqHdDgpcRTyyt8Jdoyep4RnTQnWqEdy7rIpO5WpSv4haF8GBrFg=
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

WWVhaCwgdGhhdCdzIGZpbmUuCgpSZXZpZXdlZC1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVu
QGFtZC5jb20+CgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogWmhvdTEsIFRhbyA8
VGFvLlpob3UxQGFtZC5jb20+IApTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMTkgMzow
MSBQTQpUbzogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IHJlcGxhY2UgRFJNX0VSUk9SIHdpdGgg
RFJNX1dBUk4gaW4gcmFzX3Jlc2VydmVfYmFkX3BhZ2VzCgoKCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPiBGcm9tOiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+Cj4gU2Vu
dDogMjAxOeW5tDnmnIgxN+aXpSAxNDo1Mgo+IFRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1k
LmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyAKPiBaaGFuZywgSGF3a2luZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6
IHJlcGxhY2UgRFJNX0VSUk9SIHdpdGggRFJNX1dBUk4gaW4gCj4gcmFzX3Jlc2VydmVfYmFkX3Bh
Z2VzCj4gCj4gCj4gCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBaaG91MSwg
VGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTcsIDIw
MTkgMjoyNSBQTQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hlbiwgR3Vj
aHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgCj4gWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KPiBDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+Cj4gU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kZ3B1OiByZXBsYWNlIERSTV9FUlJPUiB3aXRoIERSTV9XQVJOIGlu
IAo+IHJhc19yZXNlcnZlX2JhZF9wYWdlcwo+IAo+IFRoZXJlIGFyZSB0d28gY2FzZXMgb2YgcmVz
ZXJ2ZSBlcnJvciBzaG91bGQgYmUgaWdub3JlZDoKPiAxKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVl
biBhbGxvY2F0ZWQgKHVzZWQgYnkgc29tZW9uZSk7Cj4gMikgYSByYXMgYmFkIHBhZ2UgaGFzIGJl
ZW4gcmVzZXJ2ZWQgKGR1cGxpY2F0ZSBlcnJvciBpbmplY3Rpb24gZm9yIG9uZSAKPiBwYWdlKTsK
PiAKPiBEUk1fRVJST1IgaXMgdW5uZWNlc3NhcnkgZm9yIHRoZSBmYWlsdXJlIG9mIGJhZCBwYWdl
IHJlc2VydmUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDcgKysr
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gaW5kZXggNzllNWU1
YmU4YjM0Li41ZjYyM2RhZjUwNzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jCj4gQEAgLTE0MDksMTAgKzE0MDksMTUgQEAgaW50IGFtZGdwdV9yYXNfcmVzZXJ2
ZV9iYWRfcGFnZXMoc3RydWN0Cj4gYW1kZ3B1X2RldmljZSAqYWRldikKPiAgCWZvciAoaSA9IGRh
dGEtPmxhc3RfcmVzZXJ2ZWQ7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7Cj4gIAkJYnAgPSBkYXRh
LT5icHNbaV0ucmV0aXJlZF9wYWdlOwo+IAo+ICsJCS8qIFRoZXJlIGFyZSB0d28gY2FzZXMgb2Yg
cmVzZXJ2ZSBlcnJvciBzaG91bGQgYmUgaWdub3JlZDoKPiArCQkgKiAxKSBhIHJhcyBiYWQgcGFn
ZSBoYXMgYmVlbiBhbGxvY2F0ZWQgKHVzZWQgYnkgc29tZW9uZSk7Cj4gKwkJICogMikgYSByYXMg
YmFkIHBhZ2UgaGFzIGJlZW4gcmVzZXJ2ZWQgKGR1cGxpY2F0ZSBlcnJvcgo+IGluamVjdGlvbgo+
ICsJCSAqICAgIGZvciBvbmUgcGFnZSk7Cj4gKwkJICovCj4gIAkJaWYgKGFtZGdwdV9ib19jcmVh
dGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IFBBR0VfU0hJRlQsIFBBR0VfU0laRSwKPiAgCQkJCQkg
ICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKPiAgCQkJCQkgICAgICAgJmJvLCBOVUxMKSkK
PiBbR3VjaHVuXURvIHdlIG5lZWQgdG8gY2hhbmdlIFBBR0VfU0hJRlQgdG8gQU1ER1BVX0dQVV9Q
QUdFX1NISUZUIGhlcmU/CltUYW9dIEFsZXggaGFzIGFub3RoZXIgcGF0Y2ggdG8gZml4IGl0LCB5
b3UgY2FuIGZpbmQgaXQgaW4gbWFpbCBsaXN0LgoKPiAKPiAtCQkJRFJNX0VSUk9SKCJSQVMgRVJS
T1I6IHJlc2VydmUgdnJhbSAlbGx4IGZhaWxcbiIsCj4gYnApOwo+ICsJCQlEUk1fV0FSTigiUkFT
IFdBUk46IHJlc2VydmUgdnJhbSBmb3IgcmV0aXJlZAo+IHBhZ2UgJWxseCBmYWlsXG4iLCBicCk7
Cj4gCj4gIAkJZGF0YS0+YnBzX2JvW2ldID0gYm87Cj4gIAkJZGF0YS0+bGFzdF9yZXNlcnZlZCA9
IGkgKyAxOwo+IC0tCj4gMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
