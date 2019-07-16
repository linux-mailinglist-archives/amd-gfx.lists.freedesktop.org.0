Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D46A0B2
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 05:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB06E083;
	Tue, 16 Jul 2019 03:01:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680055.outbound.protection.outlook.com [40.107.68.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0715C6E083
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 03:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xf+vm/N0TD7T9a6ZjY4kgXDj/B+MXp0J4lp2GGGL/a4XHMeKpBps3pRsp02pRBxipGHQQ+ujK27t5ESc/oWS2hUfyaB0l0CEJoNn4wif4g35tfcJB9weoaUzeaKr0RXT6MSEj0gQt3h+oCfA++TzmT8r+bsM8ObprnL/v056/uzXXIpOgjaMUey8TC7AIJe6cI/rRCNaRshdcJs7dyITeGT03HREIWQWAuQhiCHlgSER4a97tJkntrTj+9CJ7WNInVYktStAVs6movrbRQCgouKfv/WLts8joJgWDuEr6ERCnSp0ZdTTmt4M/ug68l/1RMiQsKOpqAkHdJxkpbfluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7aLJ+EKMRGMgN07UbRPn1lPIk5qnrGv719HKKTTizc=;
 b=bR1uSJkOuW7CikJ+imxb4ky1rl0D7IR4KzUvptTZIDtlvwrJOohgrJztOcpWBbL4Dz+qL9Fw5jZORBirgXKNqm4k8e/xfsoktQHRlRB7EVDOuqyEGMILcA37p//eYfbFZB4+FdgEnjFrIG66pOwBDP+kAomjJkRo+OyEgkzO6m1lh90LMA29MhJv6a+q+ZfiJd0MXuKKBvAkOBsNItYpAdU5YzEOq+hwYr/qQkqyHY5PsoS65qGd8mwY9uw2RY75PoD4kkWzo29j/b4lurbxf4xup22hEowD173QBElwnypC08rCRCirYRb5BASk0m+wv+RADapG51zGaQTIiwNOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2893.namprd12.prod.outlook.com (20.179.83.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 03:01:53 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 03:01:53 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix memory allocation failure check V2
Thread-Topic: [PATCH] drm/amd/powerplay: fix memory allocation failure check V2
Thread-Index: AQHVOHHkU0Z3wa8vF0GAGfoXbKKvNabMlLew
Date: Tue, 16 Jul 2019 03:01:53 +0000
Message-ID: <MN2PR12MB3344D9BE36CA42BF16EA2A18E4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712052242.20369-1-evan.quan@amd.com>
In-Reply-To: <20190712052242.20369-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81ea3d09-088f-4590-7d64-08d70999f4cf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2893; 
x-ms-traffictypediagnostic: MN2PR12MB2893:
x-microsoft-antispam-prvs: <MN2PR12MB289389DE0E74DAB8F79BAD0FE4CE0@MN2PR12MB2893.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(13464003)(199004)(189003)(186003)(8936002)(86362001)(53546011)(102836004)(478600001)(6506007)(53936002)(76176011)(316002)(486006)(7696005)(25786009)(256004)(14444005)(99286004)(9686003)(476003)(6116002)(3846002)(55016002)(26005)(5660300002)(446003)(11346002)(52536014)(6436002)(229853002)(6246003)(14454004)(71200400001)(71190400001)(68736007)(76116006)(110136005)(33656002)(2501003)(66066001)(66476007)(8676002)(81166006)(7736002)(66556008)(64756008)(66446008)(2906002)(74316002)(66946007)(81156014)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2893;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ggM1SMgg5w3g7bZRIB1Xo4yQlvEY9lIGz/9x4T4AeahQijz0aCre3c3WzkoB/LKXjPGXABytJcK3LHxqwG1rE+9Fsj76/OKbflX51qGDU6pT92Ek0Z4pY9vtYuF9XAzKlIRKKcXSlqSehuMyEPKoEUOVHCTPk7TOHs8eNtlEfn8Kn4eLmck9JHTQievUdWxJAocGmgxBF8ivFsLYhpwV8qAnxXRt0EA2qpY42fC0m4/VieQl65USpzosGjT5BkxH4nnyNPocS2CiNPj/TFWkSnv4iIlRmrkuLGYevnnNt61diU1ez2XIZrVp3VrCI9zUemq/lglZfkBynzEB0tuX6N68KZRNoV4+BXeYNXVFlhECZp5dLg8ogkQn2pHmmdL6SDMuYeDElndlYYebVTcLMWr4rwhDJ/rQUdt6BUZh7q4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ea3d09-088f-4590-7d64-08d70999f4cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 03:01:53.7180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7aLJ+EKMRGMgN07UbRPn1lPIk5qnrGv719HKKTTizc=;
 b=pFZYQ4YgYkNJupiypk+9dKCeAkb9Aer5AWkrxEtOYrIdDPJusZ2+r0dLOSmFdc1MFmN1eAkVlsuEq7PJPKK9V+n/I8dikO4GLOIJYMsG2GZgPEQ2eOdp33T5l47vq7UvRhhPJMJ6nzCiGOXlyrQ5/K/uQzk6kmdOwVeCb1xIvxw=
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
dmFuLnF1YW5AYW1kLmNvbT4KPiBTZW50OiBGcmlkYXksIEp1bHkgMTIsIDIwMTkgMToyMyBQTQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBRdWFuLCBFdmFuIDxFdmFu
LlF1YW5AYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBmaXgg
bWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSBjaGVjawo+IFYyCj4gCj4gRml4IG1lbW9yeSBhbGxv
Y2F0aW9uIGZhaWx1cmUgY2hlY2suCj4gCj4gLSBWMjogZml4IG9uZSBtb3JlIHNpbWlsYXIgZXJy
b3IKPiAKPiBDaGFuZ2UtSWQ6IEkwMTJiMDgyYTdhMmI5Mjk3M2E3NmRiODAyOTg5N2ZiNGEzNDQx
Njk0Cj4gU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCj4gaW5kZXggMWZjMzY3
MzA3YWMwLi5jODI2ZTY1NDMwYjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jCj4gQEAgLTMxOSw3ICszMTksNyBAQCBzdGF0aWMgaW50IHZlZ2EyMF90
YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQKPiAqc211LCBzdHJ1Y3Qgc211X3RhYmxlICp0
YWJsZXMpCj4gIAkgICAgICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKPiAKPiAg
CXNtdV90YWJsZS0+bWV0cmljc190YWJsZSA9IGt6YWxsb2Moc2l6ZW9mKFNtdU1ldHJpY3NfdCks
Cj4gR0ZQX0tFUk5FTCk7Cj4gLQlpZiAoc211X3RhYmxlLT5tZXRyaWNzX3RhYmxlKQo+ICsJaWYg
KCFzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAlzbXVf
dGFibGUtPm1ldHJpY3NfdGltZSA9IDA7Cj4gCj4gQEAgLTE1MDIsNyArMTUwMiw3IEBAIHN0YXRp
YyBpbnQgdmVnYTIwX3NldF9kZWZhdWx0X29kOF9zZXR0dGluZ3Moc3RydWN0Cj4gc211X2NvbnRl
eHQgKnNtdSkKPiAKPiAgCW9kOF9zZXR0aW5ncyA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCB2ZWdh
MjBfb2Q4X3NldHRpbmdzKSwKPiBHRlBfS0VSTkVMKTsKPiAKPiAtCWlmIChvZDhfc2V0dGluZ3Mp
Cj4gKwlpZiAoIW9kOF9zZXR0aW5ncykKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAKPiAgCXNtdS0+
b2Rfc2V0dGluZ3MgPSAodm9pZCAqKW9kOF9zZXR0aW5nczsKPiAtLQo+IDIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
