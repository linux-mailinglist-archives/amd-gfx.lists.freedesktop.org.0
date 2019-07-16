Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1346A1C7
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 07:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AFB6E08E;
	Tue, 16 Jul 2019 05:12:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9F6E08E
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 05:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpnBZKpx8mDRzGFsOME4/DLTFmXhZ39inUHPPuHDcOqOITXNs5JKq3R+mhg2HZoOrKDY4eQycrM2vSaJU7SlHHOaGCm7Pn7IcwxajylBerU8QcbslFI4R2mGIQIndyKZFPpCX/jyibI6pRdEZTphQrEKEE+PTmFoPLLnsg4MtsZqktC8n01bRBgJf0QDDd7zSvrR873PX9FDTsY16Grg2EPDSeZEjmNnron/MO0z0nz7T7Y5rWJDmVRN6VgdOE3DWuH33zbgA00LPODMB3ev0I8xjLjp5Z8L+WyrDBfEcGBKlmG6n5FR2MomPrgYxMEulzRHIpQP/qi5GVx263j8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV06zcuPwN1JErN1U0EV373h3kIEfCslP8Oat9afXoM=;
 b=iCWeomoWokVufsrn0utbSfecWsFpxFAwvednBhoDE8DXcnnVO/HgAqf64We9rpki4wir79QKnJ8ElHIudFrvJe4Gv08OWFoqQ/oEzxK+RmhdiQWyZTUqevoxFomP+4txg0u+i+yFvhS5aWFNr+TtGrnHf/Zpn7We48VQ1rpzyzMmfbrA2676G18OgrN0EbKxTEcNJPBXyCtb7e+xUm0ITavspBAN/tPxj5VwivPngWNzrv7Qi+fVrmfIU/wo85/qT/TsMDGlAHqv6KIjCSsIcYr0oYG9jcXpk+ZiPJLy4y/PoM5u6MOjY/1K3r23Vg2lEb9UyuH/96xLqnLd/FMzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2879.namprd12.prod.outlook.com (20.179.80.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 05:12:13 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 05:12:13 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: avoid access before allocation
Thread-Topic: [PATCH] drm/amd/powerplay: avoid access before allocation
Thread-Index: AQHVOF00WSzkHPnKNUC6rrEbHrfF5qbMuUmQ
Date: Tue, 16 Jul 2019 05:12:13 +0000
Message-ID: <MN2PR12MB334419B332848A4DE7AE5F67E4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712025439.16511-1-evan.quan@amd.com>
In-Reply-To: <20190712025439.16511-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 076c74d6-872f-4938-50c2-08d709ac29de
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2879; 
x-ms-traffictypediagnostic: MN2PR12MB2879:
x-microsoft-antispam-prvs: <MN2PR12MB28798F717ACA739C33D41780E4CE0@MN2PR12MB2879.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:196;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(189003)(13464003)(199004)(55016002)(9686003)(3846002)(6246003)(33656002)(6116002)(53936002)(74316002)(305945005)(68736007)(8676002)(478600001)(7736002)(6436002)(2906002)(66066001)(486006)(256004)(81156014)(52536014)(8936002)(110136005)(53546011)(6506007)(76116006)(316002)(2501003)(66476007)(64756008)(476003)(66556008)(71200400001)(81166006)(66946007)(102836004)(11346002)(446003)(66446008)(71190400001)(229853002)(26005)(86362001)(14454004)(76176011)(25786009)(5660300002)(186003)(99286004)(7696005)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2879;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +5w0S8rTCoEqW1qGbS2H4iwK8uwR+ukPJ7jRGOYuP2piwZgaQJ7vqrRaZFW0wofsNLcp4WzaOqxbngVQIZcbyaDpya6crlGiXH+73+fQamDOHk5pV+AE/UrMeIarwhc+BPSYBNnqQkRWJiCvBUAOKxgyoqgPeBAWqsNcb1Fkq2IczfMaEx60J4VS7HOd7m2ZY2RI7eIzrKJQ/3Gn3TEJ17m+F07Dryzny3W8Mzi35yS3RHe7xBsN66ehCJzQn8WuF6+IuqymgMmLq7AXnS6gXnRyiSA+aVJ7Eb0H0TqnyWvqX/pBq/9Dt4hALW1EDId2wNqz6l8kZpXMnvgqAA3hRUHLP7NNJvlFZq/uM12CiSJMo0Ughj5GK2TqNyVT6z1CtsozxWJjm/jC2VTX3AyzqUKorMaoelkGjhp1+HKrYE0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076c74d6-872f-4938-50c2-08d709ac29de
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 05:12:13.6045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2879
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV06zcuPwN1JErN1U0EV373h3kIEfCslP8Oat9afXoM=;
 b=HSu24beP44qUeAy1wjn+TtM8BvVTwhklZvUXXvm9KxvmXgMLoD7CiIFoFI32R1bAYW1fMSN063Afxa0vq8bvpLHnSCvxKhXMz9Xr0GslTXJMWMqzc/ie4apscdrK26h1JoCAX2WNJ/5YmVx63Hf1la3TSCwTY0GWDs5Ntz1WoIM=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KPiBTZW50OiBGcmlkYXksIEp1bHkgMTIsIDIwMTkgMTA6NTUgQU0K
PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogUXVhbiwgRXZhbiA8RXZh
bi5RdWFuQGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogYXZv
aWQgYWNjZXNzIGJlZm9yZSBhbGxvY2F0aW9uCj4gCj4gTm8gYWNjZXNzIGJlZm9yZSBhbGxvY2F0
aW9uLgo+IAo+IENoYW5nZS1JZDogSWExZDc4Nzg2ZjI0MDBjZDFjZDIyN2QxYWI2ZWE0YzZhNzE2
MTllNGMKPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgfCAxMSArKysr
KysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBf
cHB0LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+IGlu
ZGV4IDllM2U3Mzc5MjZhYS4uYzcwMjYyZTZlMjUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+IEBAIC00NDEsNyArNDQxLDYgQEAgc3RhdGljIGlu
dCB2ZWdhMjBfc3RvcmVfcG93ZXJwbGF5X3RhYmxlKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUp
ICB7Cj4gIAlBVE9NX1ZlZ2EyMF9QT1dFUlBMQVlUQUJMRSAqcG93ZXJwbGF5X3RhYmxlID0gTlVM
TDsKPiAgCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNt
dV90YWJsZTsKPiAtCWludCByZXQ7Cj4gCj4gIAlpZiAoIXRhYmxlX2NvbnRleHQtPnBvd2VyX3Bs
YXlfdGFibGUpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTQ1NSw5ICs0NTQsNyBAQCBzdGF0
aWMgaW50IHZlZ2EyMF9zdG9yZV9wb3dlcnBsYXlfdGFibGUoc3RydWN0Cj4gc211X2NvbnRleHQg
KnNtdSkKPiAgCXRhYmxlX2NvbnRleHQtPnRoZXJtYWxfY29udHJvbGxlcl90eXBlID0gcG93ZXJw
bGF5X3RhYmxlLQo+ID51Y1RoZXJtYWxDb250cm9sbGVyVHlwZTsKPiAgCXRhYmxlX2NvbnRleHQt
PlREUE9ETGltaXQgPSBsZTMyX3RvX2NwdShwb3dlcnBsYXlfdGFibGUtCj4gPk92ZXJEcml2ZThU
YWJsZS5PRFNldHRpbmdzTWF4W0FUT01fVkVHQTIwX09EU0VUVElOR19QT1dFUlBFUgo+IENFTlRB
R0VdKTsKPiAKPiAtCXJldCA9IHZlZ2EyMF9zZXR1cF9vZDhfaW5mb3JtYXRpb24oc211KTsKPiAt
Cj4gLQlyZXR1cm4gcmV0Owo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAKPiAgc3RhdGljIGludCB2ZWdh
MjBfYXBwZW5kX3Bvd2VycGxheV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkgQEAgLQo+
IDE1MDcsNiArMTUwNCwxMiBAQCBzdGF0aWMgaW50IHZlZ2EyMF9zZXRfZGVmYXVsdF9vZDhfc2V0
dHRpbmdzKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUpCj4gCj4gIAlzbXUtPm9kX3NldHRpbmdz
ID0gKHZvaWQgKilvZDhfc2V0dGluZ3M7Cj4gCj4gKwlyZXQgPSB2ZWdhMjBfc2V0dXBfb2Q4X2lu
Zm9ybWF0aW9uKHNtdSk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJcHJfZXJyKCJSZXRyaWV2ZSBib2Fy
ZCBPRCBsaW1pdHMgZmFpbGVkIVxuIik7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gIAlp
ZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsCj4gU01VX0ZFQVRVUkVfRFBNX1NPQ0NMS19C
SVQpKSB7Cj4gIAkJaWYgKG9kOF9zZXR0aW5ncy0KPiA+b2RfZmVhdHVyZV9jYXBhYmlsaXRpZXNb
QVRPTV9WRUdBMjBfT0RGRUFUVVJFX0dGWENMS19MSU1JVFNdICYmCj4gIAkJICAgIG9kOF9zZXR0
aW5ncy0KPiA+b2Rfc2V0dGluZ3NfbWF4W09EOF9TRVRUSU5HX0dGWENMS19GTUFYXSA+IDAgJiYK
PiAtLQo+IDIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
