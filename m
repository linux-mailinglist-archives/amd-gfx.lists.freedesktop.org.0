Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D206E06D
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 07:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA726E56B;
	Fri, 19 Jul 2019 05:03:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C17A6E56B
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 05:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WobpBkXdo0TAfGzaxifo/+sun7Lo1GtjjuHDBiOq3mkZG5YlGdcJdBcB+YRfq6JzqFrvHQ4fUdACNGHffVEOLlJT/iSt3/7Xmth5N8Rvh4c5BWcRkAXCnTvOTfTp+D8JVu4hj40ppvjb5dn10SNUJxpXFt+W1oajfRHIA+lhuCSWf12qd14DWevdMGqrsM1VjCDc38QyLZUPB9mzpAlKYUtLwUKF1ZdndSUxkipQQy0rM42kKGcZAX7EPSGOdKQcwl97uofJJ+mEkLIoj7sE37EqM11STS1x4SmmlaTTsENGqtbvbQMfgOzKoUv7NCyRD9s084iu+0PbrsmCIfH6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8ofyQ1q+AYNhvGTtHBLhypnkdoHO0Jndo54HTZWQWs=;
 b=OSi58P77HpdQumyiw4p51Qx5Zh81PRoRcKMWI4dbYOrJQEL3rzL7QGI/Lmh8jWprG8M6cXfaMiSLKA/sIgwCucm0U0m2j1FBg0zN06gftaWpo+iHEs8EYu459fkT71I1xdoHBLAQUQAnP9TqBgWhdixn0VFuc/CfieFqamdQAiJneOOC8jfhgVETq7rVeNmFg092QuW6NIHKlU8NCGQQP/iQGgrd7S0rrs6XhJHy5/ls1It0EGzrWoXevqiZNF7XdD5KC/RgtztyiozBuwn/pNkKMTjs/3xXZ8dzHjPxdlOJtiA/sbF7J67tV3YEPnwsOlB3sKZGcc41qTVjqxA63w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3037.namprd12.prod.outlook.com (20.178.240.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 05:03:54 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 05:03:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Index: AQHVPeRrrwjCEvFq1k2763SRVfn3ZabRYb4Q
Date: Fri, 19 Jul 2019 05:03:54 +0000
Message-ID: <MN2PR12MB3344FA52A933E4922488E720E4CB0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190719034517.25780-1-kevin1.wang@amd.com>
In-Reply-To: <20190719034517.25780-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b70cb2d4-4fa0-437c-78a7-08d70c067faf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3037; 
x-ms-traffictypediagnostic: MN2PR12MB3037:
x-microsoft-antispam-prvs: <MN2PR12MB30370CB893046C8173FDE277E4CB0@MN2PR12MB3037.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(189003)(13464003)(199004)(5660300002)(52536014)(478600001)(53936002)(76176011)(76116006)(486006)(6246003)(74316002)(316002)(305945005)(7736002)(14454004)(446003)(71190400001)(11346002)(476003)(71200400001)(6436002)(256004)(9686003)(55016002)(81156014)(4326008)(8676002)(8936002)(2906002)(66946007)(81166006)(229853002)(33656002)(110136005)(25786009)(14444005)(68736007)(2501003)(26005)(102836004)(66446008)(6116002)(186003)(3846002)(66066001)(86362001)(53546011)(66476007)(99286004)(7696005)(64756008)(54906003)(66556008)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3037;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vV2/H5/u5IegpWespL61tbyxuGWGWyTFbyfvfqB4YqBRpFoOQSizjVITff6U+zuVe0qM59BMXi+vVltCnGSyAyb+Jos7aeQ+2//uvst9ScTOjK0AXquq8P5C4f4XT+4J0sqGFl2i8xqPHz/gcZDQajJ1WhCl63OSmoJvvL828Fu3mXTIpSpHWEpshcJhKrw7+fyoSqcnT+38ZCxpTxyxQv3bO2GyeioYelbVGNCrOl/o9zlsgVAQqp3KE9WwuC4XpAup3k1KZAvHIH+xOnvZzSmlOlbamsRnAN/CYsVXefHY7BDqEvlO+Omt+pe+icHeQ1nzbm6x1gomgTHyJcaIyqDqhr8MG5FP6h3m1bUPPc2Kh81/FhLOXhZMImPsw7JszCuWzqIVX7HZPVqq4xkot2eO8QPevTq2L+wGocoLJLU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70cb2d4-4fa0-437c-78a7-08d70c067faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 05:03:54.5129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8ofyQ1q+AYNhvGTtHBLhypnkdoHO0Jndo54HTZWQWs=;
 b=czVqQLfS/j3JPuCpR+GqKEUBwsI7fSQpYGMKwNVPoXazuIrqT1vBNRLzZRKRVohKQXl/qGPJEE02bRA5onCDFHKTkR87FjHtVetY9XYpUV5sTCekb5oDbBsdu6KLu1WBAApZvhUHMWJWg8k5ZSmsOxPLjcfctXiTzl2RKneEfk0=
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
 Kenneth" <Kenneth.Feng@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q29tbWVudCBpbmxpbmUKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBXYW5n
LCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT4KPiBTZW50OiBGcmlkYXksIEp1bHkg
MTksIDIwMTkgMTE6NDYgQU0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBRdWFuLCBFdmFuCj4gPEV2
YW4uUXVhbkBhbWQuY29tPjsgSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBYdSwgRmVp
ZmVpCj4gPEZlaWZlaS5YdUBhbWQuY29tPjsgR3VpLCBKYWNrIDxKYWNrLkd1aUBhbWQuY29tPjsg
V2FuZywgS2V2aW4oWWFuZykKPiA8S2V2aW4xLldhbmdAYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFU
Q0hdIGRybS9hbWQvcG93ZXJwbGF5OiBjdXN0b20gcGVhayBjbG9jayBmcmVxIGZvciBuYXZpMTAK
PiAKPiAxLk5BVkkxMF9QRUFLX1NDTEtfWFRYICAgIDE4MzAgTWh6Cj4gMi5OQVZJMTBfUEVBS19T
Q0xLX1hUICAgICAxNzU1IE1oego+IDMuTkFWSTEwX1BFQUtfU0NMS19YTCAgICAgMTYyNSBNaHoK
PiAKPiBDaGFuZ2UtSWQ6IEk0ODg2M2E5ZDBlMjYxYjllNzc3OGE2YzBlNGE4NzYyZDdjOTc4ZGE2
Cj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jICAgIHwgNjUgKysr
KysrKysrKy0tLS0tLS0tCj4gLQo+ICAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211LmggICAgfCAgNCArKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMgICAgfCA1NSArKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuaCAgICB8ICA0ICsrCj4gIDQgZmlsZXMgY2hhbmdlZCwgOTcg
aW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gaW5kZXggN2Y1MWJiZDJhYzkwLi5hYjM4OWRkZTk1
NjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4g
QEAgLTEzNjAsMzcgKzEzNjAsNDAgQEAgaW50IHNtdV9hZGp1c3RfcG93ZXJfc3RhdGVfZHluYW1p
YyhzdHJ1Y3QKPiBzbXVfY29udGV4dCAqc211LAo+ICAJfQo+IAo+ICAJaWYgKHNtdV9kcG1fY3R4
LT5kcG1fbGV2ZWwgIT0gbGV2ZWwpIHsKPiAtCQlzd2l0Y2ggKGxldmVsKSB7Cj4gLQkJY2FzZSBB
TURfRFBNX0ZPUkNFRF9MRVZFTF9ISUdIOgo+IC0JCQlyZXQgPSBzbXVfZm9yY2VfZHBtX2xpbWl0
X3ZhbHVlKHNtdSwgdHJ1ZSk7Cj4gLQkJCWJyZWFrOwo+IC0JCWNhc2UgQU1EX0RQTV9GT1JDRURf
TEVWRUxfTE9XOgo+IC0JCQlyZXQgPSBzbXVfZm9yY2VfZHBtX2xpbWl0X3ZhbHVlKHNtdSwgZmFs
c2UpOwo+IC0JCQlicmVhazsKPiAtCj4gLQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9BVVRP
Ogo+IC0JCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9TVEFOREFSRDoKPiAtCQkJ
cmV0ID0gc211X3VuZm9yY2VfZHBtX2xldmVscyhzbXUpOwo+IC0JCQlicmVhazsKPiAtCj4gLQkJ
Y2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX01JTl9TQ0xLOgo+IC0JCWNhc2UgQU1E
X0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9NSU5fTUNMSzoKPiAtCQljYXNlIEFNRF9EUE1fRk9S
Q0VEX0xFVkVMX1BST0ZJTEVfUEVBSzoKPiAtCQkJcmV0ID0gc211X2dldF9wcm9maWxpbmdfY2xr
X21hc2soc211LCBsZXZlbCwKPiAtCQkJCQkJCSAmc2Nsa19tYXNrLAo+IC0JCQkJCQkJICZtY2xr
X21hc2ssCj4gLQkJCQkJCQkgJnNvY19tYXNrKTsKPiAtCQkJaWYgKHJldCkKPiAtCQkJCXJldHVy
biByZXQ7Cj4gLQkJCXNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgU01VX1NDTEssIDEgPDwKPiBz
Y2xrX21hc2spOwo+IC0JCQlzbXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFNNVV9NQ0xLLCAxIDw8
Cj4gbWNsa19tYXNrKTsKPiAtCQkJc211X2ZvcmNlX2Nsa19sZXZlbHMoc211LCBTTVVfU09DQ0xL
LCAxIDw8Cj4gc29jX21hc2spOwo+IC0JCQlicmVhazsKPiAtCj4gLQkJY2FzZSBBTURfRFBNX0ZP
UkNFRF9MRVZFTF9NQU5VQUw6Cj4gLQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxF
X0VYSVQ6Cj4gLQkJZGVmYXVsdDoKPiAtCQkJYnJlYWs7Cj4gKwkJcmV0ID0gc211X3NldF9wZXJm
b3JtYW5jZV9sZXZlbChzbXUsIGxldmVsKTsKPiArCQlpZiAocmV0KSB7CltRdWFuLCBFdmFuXSBT
aW5jZSB0aGlzIGFjdHVhbGx5IGhhbmRsZXMgQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9Q
RUFLIG9ubHkuIFBsZWFzZSBtb3ZlIHRoaXMgdW5kZXIgImNhc2UgQU1EX0RQTV9GT1JDRURfTEVW
RUxfUFJPRklMRV9QRUFLOiIuCkFuZCBwbGVhc2UgZ2l2ZSBpdCBhIG1vcmUgbWVhbmluZ2Z1bCBu
YW1lIGUuZy4gc211X3NldF9hc2ljX3BlYWtfcHJvZmlsZSgpLgo+ICsJCQlzd2l0Y2ggKGxldmVs
KSB7Cj4gKwkJCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfSElHSDoKPiArCQkJCXJldCA9IHNt
dV9mb3JjZV9kcG1fbGltaXRfdmFsdWUoc211LCB0cnVlKTsKPiArCQkJCWJyZWFrOwo+ICsJCQlj
YXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX0xPVzoKPiArCQkJCXJldCA9IHNtdV9mb3JjZV9kcG1f
bGltaXRfdmFsdWUoc211LAo+IGZhbHNlKTsKPiArCQkJCWJyZWFrOwo+ICsKPiArCQkJY2FzZSBB
TURfRFBNX0ZPUkNFRF9MRVZFTF9BVVRPOgo+ICsJCQljYXNlCj4gQU1EX0RQTV9GT1JDRURfTEVW
RUxfUFJPRklMRV9TVEFOREFSRDoKPiArCQkJCXJldCA9IHNtdV91bmZvcmNlX2RwbV9sZXZlbHMo
c211KTsKPiArCQkJCWJyZWFrOwo+ICsKPiArCQkJY2FzZQo+IEFNRF9EUE1fRk9SQ0VEX0xFVkVM
X1BST0ZJTEVfTUlOX1NDTEs6Cj4gKwkJCWNhc2UKPiBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9G
SUxFX01JTl9NQ0xLOgo+ICsJCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfUEVB
SzoKPiArCQkJCXJldCA9IHNtdV9nZXRfcHJvZmlsaW5nX2Nsa19tYXNrKHNtdSwgbGV2ZWwsCj4g
KwkJCQkJCQkJICZzY2xrX21hc2ssCj4gKwkJCQkJCQkJICZtY2xrX21hc2ssCj4gKwkJCQkJCQkJ
ICZzb2NfbWFzayk7Cj4gKwkJCQlpZiAocmV0KQo+ICsJCQkJCXJldHVybiByZXQ7Cj4gKwkJCQlz
bXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFNNVV9TQ0xLLCAxIDw8Cj4gc2Nsa19tYXNrKTsKPiAr
CQkJCXNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgU01VX01DTEssIDEgPDwKPiBtY2xrX21hc2sp
Owo+ICsJCQkJc211X2ZvcmNlX2Nsa19sZXZlbHMoc211LCBTTVVfU09DQ0xLLCAxCj4gPDwgc29j
X21hc2spOwo+ICsJCQkJYnJlYWs7Cj4gKwo+ICsJCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVM
X01BTlVBTDoKPiArCQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX0VYSVQ6Cj4g
KwkJCWRlZmF1bHQ6Cj4gKwkJCQlicmVhazsKPiArCQkJfQo+ICAJCX0KPiAKPiAgCQlpZiAoIXJl
dCkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdw
dV9zbXUuaAo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUu
aAo+IGluZGV4IDUxNGQzMTUxODg1My4uYmE1ZGRhZmNiZGJhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCj4gQEAgLTYzMSw2ICs2MzEs
NyBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7Cj4gIAlpbnQgKCpnZXRfdGhlcm1hbF90ZW1wZXJh
dHVyZV9yYW5nZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gc3RydWN0IHNtdV90ZW1wZXJh
dHVyZV9yYW5nZSAqcmFuZ2UpOwo+ICAJaW50ICgqZ2V0X3VjbGtfZHBtX3N0YXRlcykoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90Cj4gKmNsb2Nrc19pbl9raHosIHVpbnQzMl90ICpu
dW1fc3RhdGVzKTsKPiAgCWludCAoKnNldF9kZWZhdWx0X29kX3NldHRpbmdzKShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgYm9vbAo+IGluaXRpYWxpemUpOwo+ICsJaW50ICgqc2V0X3BlcmZvcm1h
bmNlX2xldmVsKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgaW50MzJfdAo+IGxldmVsKTsKPiAg
fTsKPiAKPiAgc3RydWN0IHNtdV9mdW5jcwo+IEBAIC05MjgsNiArOTI5LDkgQEAgc3RydWN0IHNt
dV9mdW5jcwo+ICAJKChzbXUpLT5mdW5jcy0+YmFjb19nZXRfc3RhdGU/IChzbXUpLT5mdW5jcy0K
PiA+YmFjb19nZXRfc3RhdGUoKHNtdSksIChzdGF0ZSkpIDogMCkKPiAgI2RlZmluZSBzbXVfYmFj
b19yZXNldChzbXUpIFwKPiAgCSgoc211KS0+ZnVuY3MtPmJhY29fcmVzZXQ/IChzbXUpLT5mdW5j
cy0+YmFjb19yZXNldCgoc211KSkgOiAwKQo+ICsjZGVmaW5lIHNtdV9zZXRfcGVyZm9ybWFuY2Vf
bGV2ZWwoc211LCBsZXZlbCkgXAo+ICsJKChzbXUpLT5wcHRfZnVuY3MtPnNldF9wZXJmb3JtYW5j
ZV9sZXZlbD8gKHNtdSktPnBwdF9mdW5jcy0KPiA+c2V0X3BlcmZvcm1hbmNlX2xldmVsKChzbXUp
LCAobGV2ZWwpKSA6IC1FSU5WQUwpOwo+ICsKPiAKPiAgZXh0ZXJuIGludCBzbXVfZ2V0X2F0b21f
ZGF0YV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QKPiB0YWJsZSwKPiAg
CQkJCSAgIHVpbnQxNl90ICpzaXplLCB1aW50OF90ICpmcmV2LCB1aW50OF90ICpjcmV2LAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IGluZGV4IGU0NDA0
MWEyNWU2NC4uOTAyNGQ5MTQ3N2YwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYwo+IEBAIC0xNTkwLDYgKzE1OTAsNjAgQEAgc3RhdGljIGludCBuYXZp
MTBfc2V0X3BwZmVhdHVyZV9zdGF0dXMoc3RydWN0Cj4gc211X2NvbnRleHQgKnNtdSwKPiAgCXJl
dHVybiAwOwo+ICB9Cj4gCj4gK3N0YXRpYyBpbnQgbmF2aTEwX3NldF9wZWFrX2Nsb2NrX2J5X2Rl
dmljZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiArewo+ICsJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBzbXUtPmFkZXY7Cj4gKwlpbnQgcmV0ID0gMDsKPiArCXVpbnQzMl90IHNjbGtf
ZnJlcSA9IDAsIHVjbGtfZnJlcSA9IDA7Cj4gKwl1aW50MzJfdCB1Y2xrX2xldmVsID0gMDsKPiAr
Cj4gKwlzd2l0Y2ggKGFkZXYtPnJldl9pZCkgewo+ICsJY2FzZSAweGYwOiAvKiBYVFggKi8KPiAr
CWNhc2UgMHhDMDoKPiArCQlzY2xrX2ZyZXEgPSBOQVZJMTBfUEVBS19TQ0xLX1hUWDsKPiArCQli
cmVhazsKPiArCWNhc2UgMHhmMTogLyogWFQgKi8KPiArCWNhc2UgMHhDMToKPiArCQlzY2xrX2Zy
ZXEgPSBOQVZJMTBfUEVBS19TQ0xLX1hUOwo+ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDogLyogWEwg
Ki8KPiArCQlzY2xrX2ZyZXEgPSBOQVZJMTBfUEVBS19TQ0xLX1hMOwo+ICsJCWJyZWFrOwo+ICsJ
fQo+ICsKPiArCXJldCA9IHNtdV9nZXRfZHBtX2xldmVsX2NvdW50KHNtdSwgU01VX1VDTEssICZ1
Y2xrX2xldmVsKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCXJldCA9IHNtdV9n
ZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc211LCBTTVVfVUNMSywgdWNsa19sZXZlbCAtIDEsCj4gJnVj
bGtfZnJlcSk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7CltRdWFuLCBFdmFuXSBJIHRo
aW5rIHdpdGggZHBtIGxldmVsICgzcmQgYXJndW1lbnQpIHNldCBhcyAweGZmIGRpcmVjdGx5LCAg
eW91IGNhbiAgZ2V0IHRoZSBjbG9jayBmcmVxdWVuY3kgZm9yIHRoZSBtYXggbGV2ZWwuCj4gKwo+
ICsJcmV0ID0gc211X3NldF9zb2Z0X2ZyZXFfcmFuZ2Uoc211LCBTTVVfU0NMSywgc2Nsa19mcmVx
LAo+IHNjbGtfZnJlcSk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwlyZXQgPSBz
bXVfc2V0X3NvZnRfZnJlcV9yYW5nZShzbXUsIFNNVV9VQ0xLLCB1Y2xrX2ZyZXEsCj4gdWNsa19m
cmVxKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlyZXR1cm4gcmV0Owo+
ICt9Cj4gKwo+ICtzdGF0aWMgaW50IG5hdmkxMF9zZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsIGludDMyX3QKPiBsZXZlbCkKPiArewo+ICsJaW50IHJldCA9IDA7
Cj4gKwo+ICsJc3dpdGNoIChsZXZlbCkgewo+ICsJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9Q
Uk9GSUxFX1BFQUs6Cj4gKwkJcmV0ID0gbmF2aTEwX3NldF9wZWFrX2Nsb2NrX2J5X2RldmljZShz
bXUpOwo+ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDoKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJCWJy
ZWFrOwo+ICsJfQo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewo+ICAJLnRhYmxlc19pbml0
ID0gbmF2aTEwX3RhYmxlc19pbml0LAo+ICAJLmFsbG9jX2RwbV9jb250ZXh0ID0gbmF2aTEwX2Fs
bG9jYXRlX2RwbV9jb250ZXh0LAo+IEBAIC0xNjI1LDYgKzE2NzksNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcwo+ID0gewo+ICAJLmdldF91Y2xr
X2RwbV9zdGF0ZXMgPSBuYXZpMTBfZ2V0X3VjbGtfZHBtX3N0YXRlcywKPiAgCS5nZXRfcHBmZWF0
dXJlX3N0YXR1cyA9IG5hdmkxMF9nZXRfcHBmZWF0dXJlX3N0YXR1cywKPiAgCS5zZXRfcHBmZWF0
dXJlX3N0YXR1cyA9IG5hdmkxMF9zZXRfcHBmZWF0dXJlX3N0YXR1cywKPiArCS5zZXRfcGVyZm9y
bWFuY2VfbGV2ZWwgPSBuYXZpMTBfc2V0X3BlcmZvcm1hbmNlX2xldmVsLAo+ICB9Owo+IAo+ICB2
b2lkIG5hdmkxMF9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmgKPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuaAo+IGluZGV4IDk1NzI4OGUy
MmY0Ny4uNjIwZmYxN2MyZmVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuaAo+IEBAIC0yMyw2ICsyMywxMCBAQAo+ICAjaWZuZGVmIF9fTkFWSTEwX1BQ
VF9IX18KPiAgI2RlZmluZSBfX05BVkkxMF9QUFRfSF9fCj4gCj4gKyNkZWZpbmUgTkFWSTEwX1BF
QUtfU0NMS19YVFgJCSgxODMwKQo+ICsjZGVmaW5lIE5BVkkxMF9QRUFLX1NDTEtfWFQgIAkJKDE3
NTUpCj4gKyNkZWZpbmUgTkFWSTEwX1BFQUtfU0NMS19YTCAgCQkoMTYyNSkKPiArCj4gIGV4dGVy
biB2b2lkIG5hdmkxMF9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKPiAK
PiAgI2VuZGlmCj4gLS0KPiAyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
