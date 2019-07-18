Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34E6CC8C
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 12:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7596E372;
	Thu, 18 Jul 2019 10:09:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E6B6E372
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 10:09:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiYh7nuxkIGuxToyKaU/xaW0wa79MtBFZqYvur5NHvqaz/ih1Ngkp/7wRY/Jo8pdhf4s3bBME8eLoTllB8jWCVeR5W9ctahwYUmH5FzS5SRADcvz/8IEuJihpNM/A+Gh44VoqSc29zt5gpokFdc1PbZMt3T2MjQ3v8/m1WK7o0zhBVUnCBa+g+mH5HtQBuG1qgmvmv63dig0JNIBRiBKTQ/JBoCWkZColjb0iinYFUWlqt+GJe/Ai+5The20jhn6nzw/yMpcaaa16+XQ3UV9tgPcvB6cIhU4L0k6I8PEh0DB96+URWfid9dxkiygS5nZOI4KyhXAoaBpng9nYkyscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySkf+TbQiDDU/HvVANqBUUW6POyyNCzBV4VQA4x3n1M=;
 b=QWKXc1ZGxfOqvBLT6uIDLZ6Iu5PxppE0UYDXpB6e5a9xBQDXay30xOfZwPRszf/nnV8rdDaTYB0koIxoa+S0OJsuFpjuL8Am9dIicovrrfZM8zuM/wig/4W4XNAr+zDtbeGgD7YUiyqAK1Bv/8fuM5B3k5WX4Ai/hI3NDA9fL+HvoEKrtUY6+5MljfbolJU61qLqxsR8cvcyhyH0wWWOeuMcHDNyfy2pV9f5MGpDTad0Qz0HS1B7PckcT+1/Lrk5b1kg+91Oms6i8gkfhbk2PGmChGyEYQ8qfEQK3WHosUsLqoD95f19ZKQD/AdB/ldHn+T6L+A4mzw4auw7AyjWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2SPR01MB0034.namprd12.prod.outlook.com (20.178.250.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 10:09:35 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 10:09:35 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Topic: [PATCH v2] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPU0zi/IEJ0Yhq0yFgHm+keJTNabQJxYg
Date: Thu, 18 Jul 2019 10:09:35 +0000
Message-ID: <MN2PR12MB33099DE054352C64133BAD2BECC80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190718094249.22234-1-kevin1.wang@amd.com>
In-Reply-To: <20190718094249.22234-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 277029ee-f99b-489b-d155-08d70b680966
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2SPR01MB0034; 
x-ms-traffictypediagnostic: MN2SPR01MB0034:
x-microsoft-antispam-prvs: <MN2SPR01MB0034C5FFE82DC6707C6CB5BAECC80@MN2SPR01MB0034.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:293;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(13464003)(8936002)(53936002)(68736007)(26005)(7736002)(2906002)(229853002)(3846002)(6246003)(316002)(86362001)(54906003)(5660300002)(6506007)(33656002)(52536014)(2501003)(110136005)(446003)(486006)(14454004)(6436002)(81166006)(76176011)(305945005)(476003)(66556008)(8676002)(74316002)(186003)(66946007)(7696005)(81156014)(71200400001)(4326008)(66446008)(76116006)(25786009)(66476007)(55016002)(11346002)(99286004)(6116002)(9686003)(53546011)(256004)(102836004)(478600001)(66066001)(71190400001)(64756008)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0034;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1CpOh/RgVWFXpmmzL9xC5J1LnAC6rVv31a6ATCif26PG+NDquHeTLK/41vJqdMj0Y7QarINM1/JiSlYzt1BdRD0CsI5OIWPCVttXOO6/ayxnr/d9JBC1wPrvXAZydzY6c6wVz1SlFrrKBSl2kwLVL9be8Iiw36Fxm6PcDoJEQ7k53dLyu7HQdKe3cSuoSNYacwaOL1R6xCUk4J83RUbWTluCH/b/eDwe6PzYY4JOgRRCBXKzzdxFhM4r2AY8mIYe9NYdocyNfS2H2GXEkTt1LJljDwJJt5vXpGbB155+FW8Q76Ps0YPU3eRPzGtIZVx9HXr17ItSMwlQ33x0GWS/Ojp0doHVzP3qNAWN3D6RPKiIRvnukBTYunWYweAcmqY2i3gquwZIBER9Db7ZvPziInNUbbE1An0U4s37AyRWlkU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277029ee-f99b-489b-d155-08d70b680966
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 10:09:35.6992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0034
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySkf+TbQiDDU/HvVANqBUUW6POyyNCzBV4VQA4x3n1M=;
 b=p6gcOtom2bOQmZHUX6eLDMFk+PkXJp4InppzCHqF2RaUDOjChG8CPS+/+e/ohUuEVmsXpZtZFGx0GAQw/T3GoCrroppabgHeFcoGdaIenrRlAhDvTDh5Ed4MUM5gyplBvbSZfaQvb1ubqpijoyW1bdSXCgH3LT2AitW86HXMQQc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdhbmcsIEtldmluKFlhbmcpIDxL
ZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE4LCAyMDE5IDU6NDMg
UE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogRmVuZywgS2VubmV0
aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBRdWFuLCBFdmFuCj4gPEV2YW4uUXVhbkBhbWQuY29t
PjsgSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBYdSwgRmVpZmVpCj4gPEZlaWZlaS5Y
dUBhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+Cj4gU3Vi
amVjdDogW1BBVENIIHYyXSBkcm0vYW1kL3Bvd2VycGxheTogY2hhbmdlIHN5c2ZzIHBwX2RwbV94
eHggZm9ybWF0Cj4gZm9yIG5hdmkxMAo+IAo+IHYyOgo+IHNldCBhdmVyYWdlIGNsb2NrIHZhbHVl
IG9uIGxldmVsIDEgd2hlbiBjdXJyZW50IGNsb2NrIGVxdWFsIG1pbiBvciBtYXggY2xvY2sKPiAo
ZmluZSBncmFpbmVkIGRwbSBzdXBwb3J0KS4KPiAKPiB0aGUgbmF2aTEwIGdmeGNsayAoc2Nsaykg
c3VwcG9ydCBmaW5lIGdyYWluZWQgRFBNLCBzbyB1c2UgbGV2ZWwgMSB0byBzaG93Cj4gY3VycmVu
dCBkcG0gZnJlcSBpbiBzeXNmcyBwcF9kcG1feHh4Cj4gCj4gQ2hhbmdlLUlkOiBJMTRkYWE2ZTMw
YzUyYzg5Nzk1NzA4ZWMwNjY2MDg2MmJiNDU5MTAzNgo+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdh
bmcgPGtldmluMS53YW5nQGFtZC5jb20+CgpBY2tlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdA
YW1kLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKystCj4gLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQx
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gaW5kZXggODk1YTRlNTkyZDVhLi4xZjcyMWI4NWMw
ZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4g
QEAgLTYyNywxMSArNjI3LDI2IEBAIHN0YXRpYyBpbnQKPiBuYXZpMTBfZ2V0X2N1cnJlbnRfY2xr
X2ZyZXFfYnlfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gIAlyZXR1cm4gcmV0Owo+
ICB9Cj4gCj4gK3N0YXRpYyBib29sIG5hdmkxMF9pc19zdXBwb3J0X2ZpbmVfZ3JhaW5lZF9kcG0o
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gK2VudW0gc211X2Nsa190eXBlIGNsa190eXBlKSB7
Cj4gKwlQUFRhYmxlX3QgKnBwdGFibGUgPSBzbXUtPnNtdV90YWJsZS5kcml2ZXJfcHB0YWJsZTsK
PiArCURwbURlc2NyaXB0b3JfdCAqZHBtX2Rlc2MgPSBOVUxMOwo+ICsJdWludDMyX3QgY2xrX2lu
ZGV4ID0gMDsKPiArCj4gKwljbGtfaW5kZXggPSBzbXVfY2xrX2dldF9pbmRleChzbXUsIGNsa190
eXBlKTsKPiArCWRwbV9kZXNjID0gJnBwdGFibGUtPkRwbURlc2NyaXB0b3JbY2xrX2luZGV4XTsK
PiArCj4gKwkvKiAwIC0gRmluZSBncmFpbmVkIERQTSwgMSAtIERpc2NyZXRlIERQTSAqLwo+ICsJ
cmV0dXJuIGRwbV9kZXNjLT5TbmFwVG9EaXNjcmV0ZSA9PSAwID8gdHJ1ZSA6IGZhbHNlOyB9Cj4g
Kwo+ICBzdGF0aWMgaW50IG5hdmkxMF9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LAo+ICAJCQllbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwgY2hhciAqYnVmKSAgewo+
ICAJaW50IGksIHNpemUgPSAwLCByZXQgPSAwOwo+ICAJdWludDMyX3QgY3VyX3ZhbHVlID0gMCwg
dmFsdWUgPSAwLCBjb3VudCA9IDA7Cj4gKwl1aW50MzJfdCBmcmVxX3ZhbHVlc1szXSA9IHswfTsK
PiArCXVpbnQzMl90IG1hcmtfaW5kZXggPSAwOwo+IAo+ICAJc3dpdGNoIChjbGtfdHlwZSkgewo+
ICAJY2FzZSBTTVVfR0ZYQ0xLOgo+IEBAIC02NDQsMjIgKzY1OSw0MiBAQCBzdGF0aWMgaW50IG5h
dmkxMF9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsCj4gIAkJcmV0
ID0gc211X2dldF9jdXJyZW50X2Nsa19mcmVxKHNtdSwgY2xrX3R5cGUsICZjdXJfdmFsdWUpOwo+
ICAJCWlmIChyZXQpCj4gIAkJCXJldHVybiBzaXplOwo+ICsKPiAgCQkvKiAxMEtIeiAtPiBNSHog
Ki8KPiAgCQljdXJfdmFsdWUgPSBjdXJfdmFsdWUgLyAxMDA7Cj4gCj4gLQkJc2l6ZSArPSBzcHJp
bnRmKGJ1ZiwgImN1cnJlbnQgY2xrOiAldU1oelxuIiwgY3VyX3ZhbHVlKTsKPiAtCj4gIAkJcmV0
ID0gc211X2dldF9kcG1fbGV2ZWxfY291bnQoc211LCBjbGtfdHlwZSwgJmNvdW50KTsKPiAgCQlp
ZiAocmV0KQo+ICAJCQlyZXR1cm4gc2l6ZTsKPiAKPiAtCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7
IGkrKykgewo+IC0JCQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwgY2xrX3R5
cGUsIGksCj4gJnZhbHVlKTsKPiArCQlpZiAoIW5hdmkxMF9pc19zdXBwb3J0X2ZpbmVfZ3JhaW5l
ZF9kcG0oc211LCBjbGtfdHlwZSkpIHsKPiArCQkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKysp
IHsKPiArCQkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc211LAo+IGNsa190eXBl
LCBpLCAmdmFsdWUpOwo+ICsJCQkJaWYgKHJldCkKPiArCQkJCQlyZXR1cm4gc2l6ZTsKPiArCj4g
KwkJCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVkOiAldU1oeiAlc1xuIiwKPiBpLCB2
YWx1ZSwKPiArCQkJCQkJY3VyX3ZhbHVlID09IHZhbHVlID8gIioiIDogIiIpOwo+ICsJCQl9Cj4g
KwkJfSBlbHNlIHsKPiArCQkJcmV0ID0gc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzbXUsIGNs
a190eXBlLCAwLAo+ICZmcmVxX3ZhbHVlc1swXSk7Cj4gKwkJCWlmIChyZXQpCj4gKwkJCQlyZXR1
cm4gc2l6ZTsKPiArCQkJcmV0ID0gc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzbXUsIGNsa190
eXBlLAo+IGNvdW50IC0gMSwKPiArJmZyZXFfdmFsdWVzWzJdKTsKPiAgCQkJaWYgKHJldCkKPiAg
CQkJCXJldHVybiBzaXplOwo+IAo+IC0JCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwgIiVk
OiAldU1oeiAlc1xuIiwgaSwgdmFsdWUsCj4gLQkJCQkJY3VyX3ZhbHVlID09IHZhbHVlID8gIioi
IDogIiIpOwo+ICsJCQlmcmVxX3ZhbHVlc1sxXSA9IGN1cl92YWx1ZTsKPiArCQkJbWFya19pbmRl
eCA9IGN1cl92YWx1ZSA9PSBmcmVxX3ZhbHVlc1swXSA/IDAgOgo+ICsJCQkJICAgICBjdXJfdmFs
dWUgPT0gZnJlcV92YWx1ZXNbMl0gPyAyIDogMTsKPiArCQkJaWYgKG1hcmtfaW5kZXggIT0gMSkK
PiArCQkJCWZyZXFfdmFsdWVzWzFdID0gKGZyZXFfdmFsdWVzWzBdICsKPiBmcmVxX3ZhbHVlc1sy
XSkgLyAyOwo+ICsKPiArCQkJZm9yIChpID0gMDsgaSA8IDM7IGkrKykgewo+ICsJCQkJc2l6ZSAr
PSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlZDogJXVNaHogJXNcbiIsCj4gaSwgZnJlcV92YWx1ZXNb
aV0sCj4gKwkJCQkJCWkgPT0gbWFya19pbmRleCA/ICIqIiA6ICIiKTsKPiArCQkJfQo+ICsKPiAg
CQl9Cj4gIAkJYnJlYWs7Cj4gIAlkZWZhdWx0Ogo+IC0tCj4gMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
