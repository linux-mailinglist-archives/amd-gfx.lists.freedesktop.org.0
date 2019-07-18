Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB556CAC2
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750406E34C;
	Thu, 18 Jul 2019 08:16:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54646E34E
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/KqoQbU1wdR6Z5XaFS4rSRxrEzvdYqildy+WVD6+ZOrtijNWfI351a2Brn3SOlZ0Ud2qXUj9Kz7mJ4h71WqYk9Or1Ng8YhWGA9W6LjaSj8CaLhExRUY13pWmvc9nvll+E6Tshvn0OhZdwaUsPd2Mw+gbJmgHxEg7l2uZWvw7l4PudCTjgUb7gdV90Fyb7u9ZeqaRBfPFcnUTWmJkwGFs8x4Y7UpC3BYSRnXp/0GvM8c5Q3UunJ+GsLfK8SSJCdnWmGMNZ5zuAu37Xh0W7/RHGInG+5BV+ESjpkAdR5pkQb3RgrqSyenF6gEhegyj5EyvPHoXJfTjKbRVosQbjGpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2eBSFWsyp8GB/AxQ18wT1OZ0sDfodnDxom6SbNfNUs=;
 b=O/t5dgIw3Yfc75FtgeidezUCLMBbVpjGAJXV0WoEGj07Uh0cMHeI97y+c2KOPd0jvqZ33pG/fMa8BLwflIwk6coVg/3/Coz2atXFMsF6iHb+5m4N1J00IbvDEAML5+UfQGBXCGKQG4ylqKWBqOoZ1SB+1y/EbDaAa6XdLYpvuEVjc56pdvsf/CWNcQ1X6qosGRw07HMtE2ojagKxNWkN5x5zbtTmXKkcTM3rz8vgB5fPOE/GkSotiTUGG8BOG8ctAOCGgIetZVJLIHCIBzTuVc89dQEakElj47bJ1TKS2br/J+F3lF+//E1sdkWnvB60rGmJ5aCp5pXrpXK6PqYJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2877.namprd12.prod.outlook.com (20.179.81.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 08:16:22 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 08:16:22 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Topic: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPT8WKhf+ENuPuUabqlRp0Ta+YqbQBvDA
Date: Thu, 18 Jul 2019 08:16:22 +0000
Message-ID: <MN2PR12MB3344E71BF98AB9178B871D00E4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190718080142.26040-1-kevin1.wang@amd.com>
In-Reply-To: <20190718080142.26040-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85f6005e-9014-47d9-69cc-08d70b58385f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2877; 
x-ms-traffictypediagnostic: MN2PR12MB2877:
x-microsoft-antispam-prvs: <MN2PR12MB287721EEE4F35D4378DF04AAE4C80@MN2PR12MB2877.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(13464003)(189003)(199004)(76116006)(64756008)(68736007)(55016002)(478600001)(6506007)(66946007)(5660300002)(66476007)(66446008)(6436002)(66556008)(186003)(6246003)(476003)(8936002)(9686003)(4326008)(26005)(316002)(81156014)(81166006)(53936002)(53546011)(229853002)(2906002)(3846002)(52536014)(446003)(486006)(11346002)(7696005)(25786009)(6116002)(71190400001)(102836004)(2501003)(7736002)(305945005)(110136005)(99286004)(86362001)(33656002)(74316002)(76176011)(66066001)(256004)(71200400001)(54906003)(14454004)(8676002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2877;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4cL9PyfYpAiy2cPJX2jPBBgQfhpr1PLgn806e32tgdpXKxMF7bsj5GNAQksAjbY3owgjrlNPn3vII7f2Q5iJm3eh8slX77v2wul+IAAANQTVMl81Ig43zPwRRAtrhsM1vKC0LvLN+1ZhT/ATF8dfvfy8z71fl6+yKmXmAFlxojN/Z6XBVB8UJ3GkTMhgpvI6Ijj6p0TcsKwJJlPjTBCADARb1qsTBDycwcygcjvmKr2+rixdQa2ILQVWeTdMvD0wCb3s5GHhBMJBt80ngg4Mv4Y7pq2IkmPdOJtynhrS13RYWUjT5P7sDU2prRFfJ15Bdb/QpZsiPNE8p6wGGWYNefgB2eJg4UK94BrYU2hNIqodPq2pLIisnEBAwDITKiL5qApiepH9zChAJEmjvArCRTwTckPFXhguzeLslMDWnRg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f6005e-9014-47d9-69cc-08d70b58385f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 08:16:22.5410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2eBSFWsyp8GB/AxQ18wT1OZ0sDfodnDxom6SbNfNUs=;
 b=ti0Tv9ZYKqYe0hEzvOtytp4KcTzJTP1qjkC7x6s5B2hdBXTHMTGj9kbBzsJKD/t+UaFwGf5IbcL6eyGmowI0mCY6gKWKhIhbOn0x8VpTAc3lA8vsXu9agT+Mb51MRhC38yDWyR/o7wEfCNAvCIlghgvg2CI2sawtApo3KDuNKAg=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MS4gUGxlYXNlIGNvbW1vbmlsemllIGEgbmV3IEFQSSBlLmcuIHNtdV9pc19maW5lX2dyYWluZWRf
ZHBtIHdoaWNoIGNhbiBiZSBzaGFyZWQgZm9yIG90aGVyIGNsb2NrcyBpbiBmdXR1cmUuCjIuIGlm
IHRoZSBjdXJyZW50IGNsb2NrIGlzIHNhbWUgYXMgbWluIG9yIG1heCwgdGhlIG91dHB1dCB3aWxs
IGJlIGEgbGl0dGxlIHN0cmFuZ2UKICAgIDA6IDMwME0gKgogICAgMTogMzAwTQogICAgIDI6IDE4
MDBNClBsZWFzZSBjaGVjayBob3cgcmF2ZW4gaGFuZGxlIHRoaXMgc2l0dWF0aW9uLgoKUmVnYXJk
cywKRXZhbgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogV2FuZywgS2V2aW4o
WWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+Cj4gU2VudDogVGh1cnNkYXksIEp1bHkgMTgsIDIw
MTkgNDowMiBQTQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBGZW5n
LCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IFF1YW4sIEV2YW4KPiA8RXZhbi5RdWFu
QGFtZC5jb20+OyBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IFh1LCBGZWlmZWkKPiA8
RmVpZmVpLlh1QGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNv
bT4KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBjaGFuZ2Ugc3lzZnMgcHBf
ZHBtX3h4eCBmb3JtYXQgZm9yCj4gbmF2aTEwCj4gCj4gdGhlIG5hdmkxMCBnZnhjbGsgKHNjbGsp
IHN1cHBvcnQgZmluZSBncmFpbmVkIERQTSwKPiBzbyB1c2UgbGV2ZWwgMSB0byBzaG93IGN1cnJl
bnQgZHBtIGZyZXEgaW4gc3lzZnMgcHBfZHBtX3h4eAo+IAo+IENoYW5nZS1JZDogSWRhZTI0MjRm
OGNjOTFmZTk0Y2ViZTdmMzEwM2UxMTJiNGY5MTJmYmMKPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBX
YW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMgfCA0MSArKysrKysrKysrKysrKysrKy0tCj4gLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IGluZGV4IDg5NWE0ZTU5
MmQ1YS4uZWY2MGI5MmZlZjZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYwo+IEBAIC02MzIsNiArNjMyLDEwIEBAIHN0YXRpYyBpbnQgbmF2aTEwX3By
aW50X2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0Cj4gKnNtdSwKPiAgewo+ICAJaW50IGks
IHNpemUgPSAwLCByZXQgPSAwOwo+ICAJdWludDMyX3QgY3VyX3ZhbHVlID0gMCwgdmFsdWUgPSAw
LCBjb3VudCA9IDA7Cj4gKwl1aW50MzJfdCBmcmVxX3ZhbHVlc1szXSA9IHswfTsKPiArCXVpbnQz
Ml90IGNsa19pbmRleCA9IDAsIG1hcmtfaW5kZXggPSAwOwo+ICsJUFBUYWJsZV90ICpwcHRhYmxl
ID0gc211LT5zbXVfdGFibGUuZHJpdmVyX3BwdGFibGU7Cj4gKwlEcG1EZXNjcmlwdG9yX3QgKmRw
bV9kZXNjID0gTlVMTDsKPiAKPiAgCXN3aXRjaCAoY2xrX3R5cGUpIHsKPiAgCWNhc2UgU01VX0dG
WENMSzoKPiBAQCAtNjQxLDI1ICs2NDUsNDYgQEAgc3RhdGljIGludCBuYXZpMTBfcHJpbnRfY2xr
X2xldmVscyhzdHJ1Y3QKPiBzbXVfY29udGV4dCAqc211LAo+ICAJY2FzZSBTTVVfVUNMSzoKPiAg
CWNhc2UgU01VX0ZDTEs6Cj4gIAljYXNlIFNNVV9EQ0VGQ0xLOgo+ICsJCWNsa19pbmRleCA9IHNt
dV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOwo+ICsJCWRwbV9kZXNjID0gJnBwdGFibGUt
PkRwbURlc2NyaXB0b3JbY2xrX2luZGV4XTsKPiArCj4gIAkJcmV0ID0gc211X2dldF9jdXJyZW50
X2Nsa19mcmVxKHNtdSwgY2xrX3R5cGUsICZjdXJfdmFsdWUpOwo+ICAJCWlmIChyZXQpCj4gIAkJ
CXJldHVybiBzaXplOwo+IC0JCS8qIDEwS0h6IC0+IE1IeiAqLwo+IC0JCWN1cl92YWx1ZSA9IGN1
cl92YWx1ZSAvIDEwMDsKPiAtCj4gLQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiwgImN1cnJlbnQgY2xr
OiAldU1oelxuIiwgY3VyX3ZhbHVlKTsKPiAKPiAgCQlyZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9j
b3VudChzbXUsIGNsa190eXBlLCAmY291bnQpOwo+ICAJCWlmIChyZXQpCj4gIAkJCXJldHVybiBz
aXplOwo+IAo+IC0JCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Cj4gLQkJCXJldCA9IHNt
dV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc211LCBjbGtfdHlwZSwgaSwKPiAmdmFsdWUpOwo+ICsJ
CS8qIDAgLSBGaW5lIGdyYWluZWQgRFBNLCAxIC0gRGlzY3JldGUgRFBNICovCj4gKwkJaWYgKGRw
bV9kZXNjLT5TbmFwVG9EaXNjcmV0ZSA9PSAxKSB7Cj4gKwkJCS8qIDEwS0h6IC0+IE1IeiAqLwo+
ICsJCQljdXJfdmFsdWUgPSBjdXJfdmFsdWUgLyAxMDA7Cj4gKwkJCWZvciAoaSA9IDA7IGkgPCBj
b3VudDsgaSsrKSB7Cj4gKwkJCQlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwK
PiBjbGtfdHlwZSwgaSwgJnZhbHVlKTsKPiArCQkJCWlmIChyZXQpCj4gKwkJCQkJcmV0dXJuIHNp
emU7Cj4gKwo+ICsJCQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNpemUsICIlZDogJXVNaHogJXNc
biIsCj4gaSwgdmFsdWUsCj4gKwkJCQkJCWN1cl92YWx1ZSA9PSB2YWx1ZSA/ICIqIiA6ICIiKTsK
PiArCQkJfQo+ICsJCX0gZWxzZSB7Cj4gKwkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfYnlfaW5k
ZXgoc211LCBjbGtfdHlwZSwgMCwKPiAmZnJlcV92YWx1ZXNbMF0pOwo+ICsJCQlpZiAocmV0KQo+
ICsJCQkJcmV0dXJuIHNpemU7Cj4gKwkJCXJldCA9IHNtdV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgo
c211LCBjbGtfdHlwZSwKPiBjb3VudCAtIDEsICZmcmVxX3ZhbHVlc1syXSk7Cj4gIAkJCWlmIChy
ZXQpCj4gIAkJCQlyZXR1cm4gc2l6ZTsKPiAKPiAtCQkJc2l6ZSArPSBzcHJpbnRmKGJ1ZiArIHNp
emUsICIlZDogJXVNaHogJXNcbiIsIGksIHZhbHVlLAo+IC0JCQkJCWN1cl92YWx1ZSA9PSB2YWx1
ZSA/ICIqIiA6ICIiKTsKPiArCQkJZnJlcV92YWx1ZXNbMV0gPSBjdXJfdmFsdWUgLyAxMDA7Cj4g
KwkJCW1hcmtfaW5kZXggPSBjdXJfdmFsdWUgPT0gZnJlcV92YWx1ZXNbMF0gPyAwIDoKPiArCQkJ
CSAgICAgY3VyX3ZhbHVlID09IGZyZXFfdmFsdWVzWzJdID8gMiA6IDE7Cj4gKwo+ICsJCQlmb3Ig
KGkgPSAwOyBpIDwgMzsgaSsrKSB7Cj4gKwkJCQlzaXplICs9IHNwcmludGYoYnVmICsgc2l6ZSwg
IiVkOiAldU1oeiAlc1xuIiwKPiBpLCBmcmVxX3ZhbHVlc1tpXSwKPiArCQkJCQkJaSA9PSBtYXJr
X2luZGV4ID8gIioiIDogIiIpOwo+ICsJCQl9Cj4gKwo+ICAJCX0KPiAgCQlicmVhazsKPiAgCWRl
ZmF1bHQ6Cj4gLS0KPiAyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
