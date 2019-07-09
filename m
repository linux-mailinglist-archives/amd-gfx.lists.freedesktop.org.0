Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EF62D51
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 03:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A9489B99;
	Tue,  9 Jul 2019 01:16:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981A289B95
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 01:16:08 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3396.namprd12.prod.outlook.com (20.178.211.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 01:16:06 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 01:16:06 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: enable IP discovery by default on navi
Thread-Topic: [PATCH 3/3] drm/amdgpu: enable IP discovery by default on navi
Thread-Index: AQHVNb27xJpC5PIVZUGTHuTCGY7T06bBfEgP
Date: Tue, 9 Jul 2019 01:16:06 +0000
Message-ID: <0FD6BA84-9EF5-4A25-8EF1-EFC12F9A46EC@amd.com>
References: <20190708184811.6409-1-alexander.deucher@amd.com>,
 <20190708184811.6409-3-alexander.deucher@amd.com>
In-Reply-To: <20190708184811.6409-3-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [112.64.61.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6cf173b-f6c8-465b-80d7-08d7040b04bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3396; 
x-ms-traffictypediagnostic: BN8PR12MB3396:
x-microsoft-antispam-prvs: <BN8PR12MB3396E7D10D1F26823722E93C89F10@BN8PR12MB3396.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(478600001)(68736007)(2906002)(6916009)(5660300002)(25786009)(6486002)(66446008)(14444005)(6436002)(6116002)(3846002)(229853002)(72206003)(2616005)(64756008)(446003)(11346002)(66556008)(66476007)(316002)(73956011)(91956017)(76116006)(54906003)(4326008)(33656002)(476003)(66946007)(486006)(256004)(26005)(8676002)(81156014)(81166006)(76176011)(1411001)(71200400001)(71190400001)(36756003)(66066001)(102836004)(7736002)(8936002)(53546011)(6246003)(6506007)(86362001)(99286004)(6512007)(53936002)(305945005)(186003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3396;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ov5bxtdz1dr8Q8s4pX666Bc2xLQnIZn5Dhnl2widgMVOeSNFz0slMY5rAqD3g72JDtHvEYOpk4MFnkdh8PH6bQwiMjbgu28cF3vQmAIbwjNlDI1zjWM0g+uU8LlLWxZAswOHWmaJDXx06DFeVWhIsDD0Iyl7oZraTk6QSfxbI5/l/uD/184Jomk1R5GL7qnwfuTstvV6KuKxzIMd0xUyVM2kNrz1zMMpgQQQFwxRIc6R9oHpkyfUh7FyAJ601txw0MHTd0ynGJ5K7HT6uvMtZhd1uxGy+XDIuOLhTxSuo81vBvrKhNENeviFSDhWRR+sSjThWpugoNZgjolIWzCA0oltmBwRptGE/V2LNNT5t4EKlwBU/VTfOUZqL94twxFxp6pyg9xuH7fldUnPB6kPyxCVBrLCP14F2fjalj5+K6c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cf173b-f6c8-465b-80d7-08d7040b04bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 01:16:06.4106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3396
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7qUnIEbP5rccdQw5pWgE4eOCzP6Fz3PsXEVLYN83YI=;
 b=KkDICwx5NUU4rDVbkDxBo0qAZtpPs8Gi5WIc8F8bEYCABL1QjXFZS1DQQJdkGg6n1d6cBFXh5YsTwMSrKBehv8h1uQPdoFvrmlsl3EfYLVhFL0QigmY0EuLPTvXZml+FmPb+P9BVe+he7iXH5sw9x+6NuC70kyBniEHdL2d5mYg=
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29t
PgoKQlIsClhpYW9qaWUKCj4gT24gSnVsIDksIDIwMTksIGF0IDI6NDggQU0sIEFsZXggRGV1Y2hl
ciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiAKPiBVc2UgdGhlIElQIGRpc2NvdmVy
eSB0YWJsZSByYXRoZXIgdGhhbiBoYXJkY29kaW5nIHRoZQo+IHNldHRpbmdzIGluIHRoZSBkcml2
ZXIuCj4gCj4gUmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+IC0tLQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDMgKyst
Cj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBpbmRleCA3OTQxYTUzNjhmYjUu
LjZmNzc3MmVlZWI3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKPiBAQCAtMTQwLDcgKzE0MCw3IEBAIHVpbnQgYW1kZ3B1X3NtdV9tZW1vcnlfcG9vbF9zaXpl
ID0gMDsKPiB1aW50IGFtZGdwdV9kY19mZWF0dXJlX21hc2sgPSAwOwo+IGludCBhbWRncHVfYXN5
bmNfZ2Z4X3JpbmcgPSAxOwo+IGludCBhbWRncHVfbWNicCA9IDA7Cj4gLWludCBhbWRncHVfZGlz
Y292ZXJ5ID0gMDsKPiAraW50IGFtZGdwdV9kaXNjb3ZlcnkgPSAtMTsKPiBpbnQgYW1kZ3B1X21l
cyA9IDA7Cj4gCj4gc3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvID0gewo+IEBAIC01
OTIsNiArNTkyLDcgQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1jYnAsIGFtZGdwdV9tY2JwLCBpbnQs
IDA0NDQpOwo+IC8qKgo+ICAqIERPQzogZGlzY292ZXJ5IChpbnQpCj4gICogQWxsb3cgZHJpdmVy
IHRvIGRpc2NvdmVyIGhhcmR3YXJlIElQIGluZm9ybWF0aW9uIGZyb20gSVAgRGlzY292ZXJ5IHRh
YmxlIGF0IHRoZSB0b3Agb2YgVlJBTS4KPiArICogKC0xID0gYXV0byAoZGVmYXVsdCksIDAgPSBk
aXNhYmxlZCwgMSA9IGVuYWJsZWQpCj4gICovCj4gTU9EVUxFX1BBUk1fREVTQyhkaXNjb3Zlcnks
Cj4gICAgIkFsbG93IGRyaXZlciB0byBkaXNjb3ZlciBoYXJkd2FyZSBJUHMgZnJvbSBJUCBEaXNj
b3ZlcnkgdGFibGUgYXQgdGhlIHRvcCBvZiBWUkFNIik7Cj4gLS0gCj4gMi4yMC4xCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
