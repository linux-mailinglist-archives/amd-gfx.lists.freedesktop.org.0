Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D43969B
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 22:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E510D8923C;
	Fri,  7 Jun 2019 20:16:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF9B8923C
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 20:16:28 +0000 (UTC)
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (20.178.198.25) by
 DM6PR12MB2681.namprd12.prod.outlook.com (20.176.116.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Fri, 7 Jun 2019 20:16:26 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::bc99:6781:3438:fbca]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::bc99:6781:3438:fbca%7]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 20:16:26 +0000
From: "Shamis, Leonid" <Leonid.Shamis@amd.com>
To: "Zhu, James" <James.Zhu@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init for
 gfx9
Thread-Topic: [PATCH] drm/amdgpu: Add GDS clearing workaround in later init
 for gfx9
Thread-Index: AQHVHU9fi+Ptg8J/EEmosJ0MSRUp9KaQf4CAgAAP5oCAAAgmgP//xoqA
Date: Fri, 7 Jun 2019 20:16:26 +0000
Message-ID: <3598A781-7AF5-4DDE-83AE-8835E85573D3@amd.com>
References: <1559925472-20077-1-git-send-email-James.Zhu@amd.com>
 <CADnq5_NBWcUtXsBbQP5uBvaOFgWXw3Lhj=ZOisVyTctqZph=xQ@mail.gmail.com>
 <19203faa-970e-732b-a0e0-d2d1fe69ce30@amd.com>
 <65266293-ac7a-c3ef-752b-1691299b1f28@amd.com>
In-Reply-To: <65266293-ac7a-c3ef-752b-1691299b1f28@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.19.0.190512
x-originating-ip: [2607:9880:24c8:63:1c20:6381:aab8:6c7e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04996cf2-d03a-4138-00bc-08d6eb850509
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2681; 
x-ms-traffictypediagnostic: DM6PR12MB2681:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB268106E4D7B53DCDAB654512FB100@DM6PR12MB2681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(366004)(346002)(396003)(39860400002)(189003)(199004)(6306002)(256004)(446003)(81166006)(6512007)(8676002)(81156014)(58126008)(14444005)(6506007)(25786009)(33656002)(82746002)(186003)(54906003)(316002)(4326008)(6246003)(76176011)(36756003)(53546011)(110136005)(966005)(91956017)(66476007)(76116006)(102836004)(73956011)(53936002)(66946007)(305945005)(66556008)(6436002)(478600001)(486006)(6116002)(46003)(11346002)(2616005)(476003)(7736002)(99286004)(6486002)(83716004)(71190400001)(5660300002)(64756008)(2906002)(14454004)(66446008)(8936002)(86362001)(72206003)(68736007)(71200400001)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2681;
 H:DM6PR12MB3370.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FJGFQemeiLz422+WqdHKtIrbe1Tu24Z8/dw3Gp+7RmDb/AGlGazF11miLLUkQWg2hUySMyr5jkNp0kV4FYZ0WywJMR1N+p5C6aQvc4QJg4g/t0nwU5i9b9j2A7r5d9AKik4GkKzN4eDhS6r93MLevVUllD7rtTdv4ZpA0WzFMZC7AqF6vH7gfXMTjdmsTurcAw0qhX+9Cz5ZZjH4r5Bw1MeqSQWLtSmWrlakumdz+e1e+FEoGNu6WUKof1YSnhYE/v5tWUbuj7QRcFySd8IikFD4Msr6n09VQ4Hqp+coWaczsLftoNt39CObZoXV9xfJUZmOtvJpiks5SehHFw9Q93S1l+tNiwYlVecNOky8ghoup7YdF+qDUtvfdLHN8sRej6i6yNdI40F7bxipLLTjv1QbHJk3RwPsoCINJJrcHKo=
Content-ID: <3FC7ED024888004A871A1DF435DF93DF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04996cf2-d03a-4138-00bc-08d6eb850509
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 20:16:26.4109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lshamis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLdcTP5u1LryrpxzeaUBz4e2cPeALMvT3UwqqWJYivw=;
 b=frLM4SImYweNzFmUxcjGSDPSP7GqRW6eEd7IugAboQjgBqlTu3mfiBVKG0xAQGhAIc1tnm65/MW2DGVYOpjGeA/LCE4Dizo1FmNtHXomKXs5sKeO7XhMmEbLs+yJ/MMOEd0yZWIw3wrvVuoO9BZDUlbEvEyu5WxTGl6TuHxU45w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leonid.Shamis@amd.com; 
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
Cc: "Gabra, Maroun" <Maroun.Gabra@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SmFtZXMsDQoNCkRvIHlvdSBzZXQgR0RTX1ZNSUQwX0JBU0UgdG8gMD8uLiBJIGRvbid0IHNlZSBp
dCBpbiB5b3VyIHBhdGNoLg0KDQpSZWdhcmRzLA0KTGVvbmlkDQoNCu+7v09uIDIwMTktMDYtMDcs
IDE1OjQyLCAiWmh1LCBKYW1lcyIgPEphbWVzLlpodUBhbWQuY29tPiB3cm90ZToNCg0KICAgIA0K
ICAgIE9uIDIwMTktMDYtMDcgMzoxMiBwLm0uLCBaaHUsIEphbWVzIHdyb3RlOg0KICAgID4gT24g
MjAxOS0wNi0wNyAyOjE2IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCiAgICA+PiBPbiBGcmks
IEp1biA3LCAyMDE5IGF0IDEyOjM4IFBNIFpodSwgSmFtZXMgPEphbWVzLlpodUBhbWQuY29tPiB3
cm90ZToNCiAgICA+Pj4gU2luY2UgSGFyZHdhcmUgYnVnLCBHRFMgZXhpc3QgRUNDIGVycm9yIGFm
dGVyIGNvbGQgYm9vdCB1cCwNCiAgICA+Pj4gYWRkaW5nIEdEUyBjbGVhcmluZyB3b3JrYXJvdW5k
IGluIGxhdGVyIGluaXQgZm9yIGdmeDkuDQogICAgPj4+DQogICAgPj4+IFNpZ25lZC1vZmYtYnk6
IEphbWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+DQogICAgPj4+IC0tLQ0KICAgID4+PiAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgNDggKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCiAgICA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2Vy
dGlvbnMoKykNCiAgICA+Pj4NCiAgICA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jDQogICAgPj4+IGluZGV4IDc2NzIyZmMuLjgxZjZiYTggMTAwNjQ0DQogICAgPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCiAgICA+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KICAgID4+PiBAQCAtMzYzNCw2ICsz
NjM0LDUwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2VudHJ5IHNlY19kZWRfY291
bnRlcl9yZWdpc3RlcnNbXSA9IHsNCiAgICA+Pj4gICAgICAgeyBTT0MxNV9SRUdfRU5UUlkoR0Ms
IDAsIG1tU1FDX0VEQ19DTlQzKSwgMCwgNCwgNn0sDQogICAgPj4+ICAgIH07DQogICAgPj4+DQog
ICAgPj4+ICsNCiAgICA+Pj4gK3N0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dkc193b3JrYXJv
dW5kcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAgICA+Pj4gK3sNCiAgICA+Pj4gKyAg
ICAgICBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAmYWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1sw
XTsNCiAgICA+Pj4gKyAgICAgICBpbnQgcjsNCiAgICA+Pj4gKw0KICAgID4+PiArICAgICAgIHIg
PSBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCAxNyk7DQogICAgPj4+ICsgICAgICAgaWYgKHIpIHsN
CiAgICA+Pj4gKyAgICAgICAgICAgICAgIERSTV9FUlJPUigiYW1kZ3B1OiBHRFMgd29ya2Fyb3Vu
ZHMgZmFpbGVkIHRvIGxvY2sgcmluZyAlcyAoJWQpLlxuIiwNCiAgICA+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmluZy0+bmFtZSwgcik7DQogICAgPj4+ICsgICAgICAgICAgICAgICByZXR1
cm4gcjsNCiAgICA+Pj4gKyAgICAgICB9DQogICAgPj4+ICsNCiAgICA+Pj4gKyAgICAgICBhbWRn
cHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfV1JJVEVfREFUQSwgMykpOw0KICAg
ID4+PiArICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RBVEFfRU5HSU5FX1NF
TCgwKSB8DQogICAgPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFdSSVRFX0RBVEFfRFNU
X1NFTCgwKSk7DQogICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU09DMTVf
UkVHX09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSkpOw0KICAgID4+PiArICAgICAgIGFt
ZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KICAgID4+PiArICAgICAgIGFtZGdwdV9yaW5nX3dy
aXRlKHJpbmcsIDB4MTAwMDApOw0KICAgID4+IGhhcmRjb2RlZCBzaXplLCBwbGVhc2UgdXNlIHRo
ZSBzaXplIGZyb20gdGhlIGRyaXZlci4NCiAgICA+Pg0KICAgID4+PiArDQogICAgPj4+ICsgICAg
ICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX0RNQV9EQVRBLCA1KSk7
DQogICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgKFBBQ0tFVDNfRE1BX0RB
VEFfQ1BfU1lOQyB8DQogICAgPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFD
S0VUM19ETUFfREFUQV9EU1RfU0VMKDEpIHwNCiAgICA+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQUNLRVQzX0RNQV9EQVRBX1NSQ19TRUwoMikgfA0KICAgID4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBBQ0tFVDNfRE1BX0RBVEFfRU5HSU5FKDApKSk7DQog
ICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQogICAgPj4+ICsgICAg
ICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQogICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jp
bmdfd3JpdGUocmluZywgMCk7DQogICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgMCk7DQogICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUM19E
TUFfREFUQV9DTURfUkFXX1dBSVQgfCAweDEwMDAwKTsNCiAgICA+PiBJbnN0ZWFkIG9mIGhhcmRj
b2RpbmcgdGhlIHNpemUsIGNhbiB5b3UgdXNlIHRoZSBnZHMgc2l6ZSBmcm9tIHRoZQ0KICAgID4+
IGRyaXZlciAoYWRldi0+Z2RzLmdkc19zaXplKS4NCiAgICA+IEhpIEFsZXgsDQogICAgPg0KICAg
ID4gRG8geW91IG1lYW4gYWRldi0+Z2RzLm1lbS50b3RhbF9zaXplPw0KICAgID4NCiAgICA+IEJ1
dCBJIHNlZSBiZWxvdyBvcGVyYXRpb24gaW4gZ2Z4X3Y5XzBfbmdnX2luaXQuDQogICAgPg0KICAg
ID4gYWRldi0+Z2RzLm1lbS50b3RhbF9zaXplIC09IC4uLi4NCiAgICA+DQogICAgPiBPciB5b3Ug
d2FudCBtZSB0byBhZGQgZ2RzX3NpemUgaW4gc3RydWN0IGFtZGdwdV9nZHM/DQogICAgPg0KICAg
ID4gSmFtZXMNCiAgICANCiAgICBZZWFoLCBUaGUgYW1kLXN0YWdpbmctZHJtLW5leHQgYnJhbmNo
IGhhcyBhZGV2LT5nZHMuZ2RzX3NpemUuDQogICAgDQogICAgSmFtZXMNCiAgICANCiAgICA+DQog
ICAgPj4gV2l0aCB0aGF0IGZpeGVkOg0KICAgID4+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQogICAgPj4NCiAgICA+Pj4gKw0KICAgID4+PiAr
ICAgICAgIGFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19XUklURV9EQVRB
LCAzKSk7DQogICAgPj4+ICsgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgV1JJVEVfREFU
QV9FTkdJTkVfU0VMKDApIHwNCiAgICA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBXUklURV9EQVRBX0RTVF9TRUwoMCkpOw0KICAgID4+PiArICAgICAgIGFtZGdwdV9yaW5nX3dy
aXRlKHJpbmcsIFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX1NJWkUpKTsNCiAg
ICA+Pj4gKyAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCiAgICA+Pj4gKyAgICAg
ICBhbWRncHVfcmluZ193cml0ZShyaW5nLCAweDApOw0KICAgID4+PiArDQogICAgPj4+ICsgICAg
ICAgYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOw0KICAgID4+PiArDQogICAgPj4+ICsgICAgICAg
cmV0dXJuIDA7DQogICAgPj4+ICt9DQogICAgPj4+ICsNCiAgICA+Pj4gKw0KICAgID4+PiAgICBz
dGF0aWMgaW50IGdmeF92OV8wX2RvX2VkY19ncHJfd29ya2Fyb3VuZHMoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQogICAgPj4+ICAgIHsNCiAgICA+Pj4gICAgICAgICAgIHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZyA9ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nWzBdOw0KICAgID4+PiBAQCAt
MzgxMCw2ICszODU0LDEwIEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZWNjX2xhdGVfaW5pdCh2b2lk
ICpoYW5kbGUpDQogICAgPj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KICAgID4+PiAg
ICAgICAgICAgfQ0KICAgID4+Pg0KICAgID4+PiArICAgICAgIHIgPSBnZnhfdjlfMF9kb19lZGNf
Z2RzX3dvcmthcm91bmRzKGFkZXYpOw0KICAgID4+PiArICAgICAgIGlmIChyKQ0KICAgID4+PiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHI7DQogICAgPj4+ICsNCiAgICA+Pj4gICAgICAgICAgIC8q
IHJlcXVpcmVzIElCcyBzbyBkbyBpbiBsYXRlIGluaXQgYWZ0ZXIgSUIgcG9vbCBpcyBpbml0aWFs
aXplZCAqLw0KICAgID4+PiAgICAgICAgICAgciA9IGdmeF92OV8wX2RvX2VkY19ncHJfd29ya2Fy
b3VuZHMoYWRldik7DQogICAgPj4+ICAgICAgICAgICBpZiAocikNCiAgICA+Pj4gLS0NCiAgICA+
Pj4gMi43LjQNCiAgICA+Pj4NCiAgICA+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCiAgICA+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCiAgICA+Pj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCiAgICA+Pj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQogICAgDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
