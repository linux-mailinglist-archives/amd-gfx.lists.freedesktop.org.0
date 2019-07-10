Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC364C73
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 20:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B342A6E11E;
	Wed, 10 Jul 2019 18:58:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730074.outbound.protection.outlook.com [40.107.73.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36756E11E
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 18:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEE/omgEIqOK+hjZZFwV2j1akoy+LUNlRXtpNJQ7UnsBozloXM60SvzneXUyg4vhVOFNHeTJASgsC4HkTQCg3w9xmh7dybJKmcvqhYK73EyFL09GpO9llu6e6oOmrofHFYYcIwM0tm85Z0Dma/WPNB7iiyY1fempSUqzsAwYmKy7IUZPyPJsEPAkLPuxfUdSz5bxh06g4GK23rqAO/bVm/xljuC9P5B4qS9rnC1OYRJ9gbYm04F96c3b9ghbH7TltKueniJUjt+t/J8Y7FE2D5PN4tefDcvPX1lbeXG8/P6QOrZkLM1m6ChW4UiAqLp6bPQWYVRiRxaMhFS3pv1bGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWTsHx1UF3YhyfjdiMbJtb4rOtGYbCtccSPypwglEfg=;
 b=c86G7X1Fw1GeDQLSZcXt60XvNQ+oQcVq9moASpMOtHVmqSHwSGhAawUEXF2noI0YUnCDts5J61IHwdoRk4RXxuiG6zzPt9G1fjn1Y7rxgNXF368o04Rtpzh/EjstOKCHwfpdf3h5AX1BRqXP/kK3cKdcbiS7mb2cvmSaga3lHI388poqC+lsxAn1Trzmi8zZTLDxFXi9Gymq9Z930yIPFI4JkNYIj6SB8miNDFc7o7TfbroLX9+72cn6vxBhfGvTmrPQU9txcWS+faAPRuFSB54mkT8d7j7COsfZ1zPeR8trB+klB9uA4y04SHxn53bOq9SstzbBZjgrKrdBY6Bt6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2809.namprd12.prod.outlook.com (20.176.117.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 18:58:36 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 18:58:36 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
Thread-Topic: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
Thread-Index: AQHVNhfAtkAJMzNa0UazWeKukI/fz6bCF7WAgACNVICAAM9fgIAAwloA
Date: Wed, 10 Jul 2019 18:58:36 +0000
Message-ID: <11769749-a0de-e121-e0f6-eeba7bae58e2@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
 <b1a0638a-4be3-0a7b-7d29-309942f24263@daenzer.net>
 <da90e4c0-067b-2ffe-01df-f59c2b7ec556@amd.com>
 <519e26e8-c363-2b4c-756c-d87fbe2543d9@daenzer.net>
In-Reply-To: <519e26e8-c363-2b4c-756c-d87fbe2543d9@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTOPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5626bee3-62a8-4f4e-c7a4-08d705689ca8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2809; 
x-ms-traffictypediagnostic: DM6PR12MB2809:
x-microsoft-antispam-prvs: <DM6PR12MB2809BF72FDABD1E25690167492F00@DM6PR12MB2809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(199004)(189003)(81166006)(81156014)(25786009)(6512007)(65806001)(64756008)(5660300002)(68736007)(4326008)(66556008)(66446008)(476003)(66476007)(2616005)(6916009)(486006)(66946007)(316002)(58126008)(66066001)(65826007)(8676002)(65956001)(64126003)(3846002)(14444005)(478600001)(6116002)(256004)(8936002)(6436002)(6246003)(71190400001)(31686004)(7736002)(229853002)(76176011)(71200400001)(86362001)(386003)(53546011)(99286004)(52116002)(66574012)(14454004)(102836004)(305945005)(26005)(11346002)(446003)(186003)(36756003)(2906002)(6486002)(53936002)(6506007)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2809;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V9IqCGmnQauKQGP9v4l5s38n7LLrJcmwK89h0Y8M2NmnpTDIvDHZ2er6i6Ye0s3WEWg+ONpOny+CSubDJxHAavoArXBid8DEziM/29O0s1WKsSovEF/FymATHmfJRGEKxRUYG7RFqZBxFnvackFyge6UGSJWZtdzWuRUDTRUY/0zKieuSEU6P2uMqkyYSEfieJNrGdskvB5rxjQJWAQSlorMnbGeEmK3H6agFXrsa+Caf/lQS11XK2omNag4Yrurp5Ijr6wyeWByn6sCrV6W1mFJlDLqs0FkBlYc7b/gbECjBvlJDXIqroEBq2Ucu41ac8yiB1S6sb5yRDckiVeu6osz2ZyHPt1EF6e0JFP4XXnShudiWxxKoktgbGwM8feIRVJr6j7b36U08cVpdCf4Wnp322rjdwFJWxbibl1gWis=
Content-ID: <28AD6EC86042D54FAC55D2B8AEB88939@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5626bee3-62a8-4f4e-c7a4-08d705689ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 18:58:36.0818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWTsHx1UF3YhyfjdiMbJtb4rOtGYbCtccSPypwglEfg=;
 b=f7utl0WjmVbI8yP3X0aKnUBFfzJNXh28XFd4XBP8WS3qXFww1jqgmrbUjyHN0OVlrQi2Z/HIeHRvetu31J/r8Qewq3X+b/UMfPAYCcJS1h1FhM61+gYIapaqtUY1jNBAB5q9fnYS+TsG7PLmk+IvmK5Xwp2YmpRUJUsHyjIffYs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xMCAzOjIyIGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPiBPbiAyMDE5
LTA3LTA5IDk6MDAgcC5tLiwgS3VlaGxpbmcsIEZlbGl4IHdyb3RlOg0KPj4gT24gMjAxOS0wNy0w
OSA2OjM0IGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPj4+IE9uIDIwMTktMDctMDkgNzoz
MiBhLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+Pj4+IFRoaXMgbWVtb3J5IGFsbG9jYXRp
b24gZmxhZyB3aWxsIGJlIHVzZWQgdG8gaW5kaWNhdGUgQk9zIGNvbnRhaW5pbmcNCj4+Pj4gc2Vu
c2l0aXZlIGRhdGEgdGhhdCBzaG91bGQgbm90IGJlIGxlYWtlZCB0byBvdGhlciBwcm9jZXNzZXMu
DQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJt
LmggfCA0ICsrKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4+
Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNs
dWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaA0KPj4+PiBpbmRleCA2MTg3MDQ3OGJjOWMuLjU4NjU5
YzI4YzI2ZSAxMDA2NDQNCj4+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgN
Cj4+Pj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgNCj4+Pj4gQEAgLTEzMSw2
ICsxMzEsMTAgQEAgZXh0ZXJuICJDIiB7DQo+Pj4+ICAgICAqIGZvciB0aGUgc2Vjb25kIHBhZ2Ug
b253YXJkIHNob3VsZCBiZSBzZXQgdG8gTkMuDQo+Pj4+ICAgICAqLw0KPj4+PiAgICAjZGVmaW5l
IEFNREdQVV9HRU1fQ1JFQVRFX01RRF9HRlg5CQkoMSA8PCA4KQ0KPj4+PiArLyogRmxhZyB0aGF0
IEJPIG1heSBjb250YWluIHNlbnNpdGl2ZSBkYXRhIHRoYXQgbXVzdCBiZSBjbGVhcmVkIGJlZm9y
ZQ0KPj4+PiArICogcmVsZWFzaW5nIHRoZSBtZW1vcnkNCj4+Pj4gKyAqLw0KPj4+PiArI2RlZmlu
ZSBBTURHUFVfR0VNX0NSRUFURV9WUkFNX1NFTlNJVElWRQkoMSA8PCA5KQ0KPj4+PiAgICANCj4+
Pj4gICAgc3RydWN0IGRybV9hbWRncHVfZ2VtX2NyZWF0ZV9pbiAgew0KPj4+PiAgICAJLyoqIHRo
ZSByZXF1ZXN0ZWQgbWVtb3J5IHNpemUgKi8NCj4+Pj4NCj4+PiBUaGlzIGZsYWcgZXNzZW50aWFs
bHkgbWVhbnMgIlBsZWFzZSBkb24ndCBsZWFrIG15IEJPIGNvbnRlbnRzIi4NCj4+PiBTaW1pbGFy
bHksIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ0xFQVJFRCBlc3NlbnRpYWxseSBtZWFucyAiUGxl
YXNlDQo+Pj4gZG9uJ3QgbGV0IG1lIHNlZSBwcmV2aW91cyBtZW1vcnkgY29udGVudHMiLg0KPj4+
DQo+Pj4gSSdkIGFyZ3VlIHRoYXQgbmVpdGhlciBmbGFnIHNob3VsZCByZWFsbHkgYmUgbmVlZGVk
OyBCTyBjb250ZW50cw0KPj4+IHNob3VsZG4ndCBiZSBsZWFrZWQgYnkgZGVmYXVsdC4NCj4+IE15
IGNvbmNsdXNpb24gZnJvbSBwcmV2aW91cyBkaXNjdXNzaW9ucyB3YXMgdGhhdCBDUkVBVEVfVlJB
TV9DTEVBUkVEIGhhcw0KPj4gbm8gc2VjdXJpdHkgaW1wbGljYXRpb25zLiBJdCdzIGJhc2ljYWxs
eSBjb21wbGV0ZWx5IGluZWZmZWN0aXZlIGFzIGENCj4+IHNlY3VyaXR5IG1lYXN1cmUuDQo+IEFi
c29sdXRlbHksIHdoaWNoIGlzIHdoeSBJIGFyZ3VlZCBhZ2FpbnN0IGl0IHdoZW4gaXQgd2FzIHBy
b3Bvc2VkLg0KPg0KPj4gSXQncyBtb3JlIGEgY29udmVuaWVuY2UgZmVhdHVyZS4gVGhlcmVmb3Jl
IEkgdGhpbmsgaXQgc3RpbGwgaGFzIGEgcGxhY2UNCj4+IGFzIHRoYXQuDQo+IEl0J2QgYmUgYSBu
by1vcCBpZiBtZW1vcnkgd2FzIGFsd2F5cyBjbGVhcmVkLiA6KQ0KPg0KPg0KPj4gSSdkIGFncmVl
IG9uIHByaW5jaXBsZSB0aGF0IGRhdGEgc2hvdWxkbid0IGJlIGxlYWtlZCBieSBkZWZhdWx0LCBi
dXQgaXQNCj4+IGhhcyBiZWVuIHRoZSBkZWZhdWx0IGZvciBhIGxvbmcgdGltZS4gTXkgaW1wcmVz
c2lvbiB3YXMgdGhhdCBncmFwaGljcw0KPj4gZ3V5cyBjYXJlZCBtb3JlIGFib3V0IHBlcmZvcm1h
bmNlIHRoYW4gc2VjdXJpdHkuIFNvIGNoYW5naW5nIHRoZSBkZWZhdWx0DQo+PiBtYXkgYmUgYSBo
YXJkIHNlbGwuIE9uIHRoZSBjb21wdXRlIHNpZGUgd2UgYWxyZWFkeSB0b29rIGEgYmlnDQo+PiBw
ZXJmb3JtYW5jZSBoaXQgYnkgY2xlYXJpbmcgYWxsIG91ciBWUkFNLCBzbyB0aGlzIGNoYW5nZSB3
b3VsZCBiZSBhbg0KPj4gaW1wcm92ZW1lbnQgZm9yIHVzLiBUaGVyZWZvcmUgSSB0aGluayBpdCBz
dGlsbCBtYWtlcyBzZW5zZSB0byBsZXQgdGhlDQo+PiBhcHBsaWNhdGlvbiBjaG9vc2UuDQo+IFdo
YXQgZXhhY3RseSBjb3VsZCB1c2Vyc3BhY2UgYmUgYWxsb3dlZCB0byBjaG9vc2UgdGhvdWdoPyBJ
IGNhbiBvbmx5DQo+IHRoaW5rIG9mIGRpc2FibGluZyB0aGUgY2xlYXJpbmcgb2YgbWVtb3J5IGl0
IGFsbG9jYXRlcyAoIlBsZWFzZSBsZWFrIG15DQo+IEJPIGNvbnRlbnRzIiksIHdoaWNoIHNlZW1z
IG9mIHJhdGhlciBkdWJpb3VzIHZhbHVlLg0KDQpJJ20gbm90IGluc2lzdGluZyB0byBsZWF2ZSBp
dCB0byB1c2VyIG1vZGUuIEJ1dCBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIA0KdG8gaGF2ZSB0aGUg
Y2hvaWNlIHBlciBCTy4gVGhlIEdFTSBpb2N0bCBjb3VsZCBzZXQgdGhlIGZsYWcgYnkgZGVmYXVs
dCANCmZvciBhbGwgdXNlciBtb2RlIGFsbG9jYXRpb25zLiBCdXQgc29tZSBrZXJuZWwgbW9kZSBC
T3MgbWF5IG5vdCBuZWVkIGl0LiANCkUuZy4gZmlybXdhcmUsIHBhZ2UgdGFibGVzLCBldGMuDQoN
ClRoZXJlIGFyZSBvdGhlciBBTURHUFVfR0VNX0NSRUFURV8gZmxhZ3MgdGhhdCBkb24ndCBtYWtl
IHNlbnNlIGZvciB1c2VyIA0KbW9kZSB0byBjaG9vc2UuIFRoaXMganVzdCBhZGRzIG9uZSBtb3Jl
Lg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPg0KPiBXaGF0IG1pZ2h0IGJlIGZlYXNpYmxl
IGlzIGFsbG93aW5nIHRoZSBzeXN0ZW0gYWRtaW5pc3RyYXRvciB0byBkaXNhYmxlDQo+IGl0LCBz
aW1pbGFyIHRvIHRoZSBtaXRpZ2F0aW9ucyBmb3IgTWVsdGRvd24vU3BlY3RyZS8uLi4gdnVsbmVy
YWJpbGl0aWVzLg0KPiBPVE9IIEkgZG9uJ3Qga25vdyBvZiBhbnkgbWVjaGFuaXNtIGZvciBkaXNh
YmxpbmcgdGhlIGNsZWFyaW5nIG9mIG5vcm1hbA0KPiBzeXN0ZW0gUkFNICh3aGljaCBpcyBhbHNv
IGVmZmVjdGl2ZSBhdCBsZWFzdCB0byBzb21lIGRlZ3JlZSBmb3IgQk9zDQo+IG91dHNpZGUgb2Yg
VlJBTSwgbWFraW5nIHRoZSB3aG9sZSB0aGluZyBhIGJpdCBpbmNvbnNpc3RlbnQpLg0KPg0KPg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
