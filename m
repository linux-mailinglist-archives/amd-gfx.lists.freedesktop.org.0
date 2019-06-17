Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C734348DBB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD0E89286;
	Mon, 17 Jun 2019 19:15:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790089.outbound.protection.outlook.com [40.107.79.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BEB89286
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:15:25 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2617.namprd12.prod.outlook.com (20.176.116.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 19:15:23 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 19:15:23 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when
 shifting
Thread-Topic: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when
 shifting
Thread-Index: AQHVItFjqqx8iWFz9ketxi+qnnOTQqagPGCA
Date: Mon, 17 Jun 2019 19:15:23 +0000
Message-ID: <1d91998e-e97c-229e-e7f6-2cc0228bf213@amd.com>
References: <20190614165108.23011-1-tom.stdenis@amd.com>
In-Reply-To: <20190614165108.23011-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ebc00cf-bed2-4e3f-63dc-08d6f3582551
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2617; 
x-ms-traffictypediagnostic: DM6PR12MB2617:
x-microsoft-antispam-prvs: <DM6PR12MB261739783A64F83D59158EDA92EB0@DM6PR12MB2617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(11346002)(486006)(5660300002)(86362001)(31696002)(31686004)(2906002)(446003)(36756003)(66946007)(73956011)(72206003)(478600001)(25786009)(66446008)(110136005)(58126008)(53936002)(71190400001)(71200400001)(65826007)(476003)(2616005)(66556008)(2501003)(64756008)(66476007)(8936002)(81166006)(81156014)(8676002)(66066001)(26005)(64126003)(7736002)(3846002)(305945005)(6116002)(256004)(316002)(99286004)(68736007)(6246003)(229853002)(14454004)(6486002)(6436002)(76176011)(52116002)(65806001)(186003)(65956001)(102836004)(53546011)(6506007)(386003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2617;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zwuDjM0b7zORpp2Iq/hua+RqcoDynkfaAxv/PrGY+fquay2DThA7W2EmXNke813cOIG9XDQEz6eTWx09XkN4bOxCQEh8cRBOT6mnlpB8yKsmUq+2LdntwX+HtWtQDPjmgUvHVbhkbYI14LK8dbtAdUSp2cdKz/+AABjvyCEUxrt2TB1PsIOwWDGBgz2pcql/zunEMLBYn2Dw+ikg9ik1vLcVDeRI+gKYHt+0YI+OnaoxJsLjRItk1p7s1cYVs9GpSBy7527FqvJSSsKw3BHoO/Egf1ivW/TBZ5TZEpTRr/8oQ9+bGjGGhJooKxFxIIpFdipfhnQHNx20b8opUQs/lnJumGJYP9P+QyjSQzZZpM971jewCWpeCT6Kg6fHBDZUBmnngfJ+OLNZhWOdZhqEFAIED7Xf5GJDVeOBbpoQDgc=
Content-ID: <A8780B3992009747845CA9A6AFF0CC10@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebc00cf-bed2-4e3f-63dc-08d6f3582551
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 19:15:23.6701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2617
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaj0RocUBjKof4wtlrsdR59FbSyFHUlTaCVDpAK17Vg=;
 b=y1gmnEH46GQeQ4rBQQUfO6CGRgiP1TTi1tteB4imcaBZR6EeS9141aQ4uhPzS98cKzuYTv2CH0/EPCLSF0PW1UWERPT7CDaSYpUHFxWueS4hTReWWZlFpvlCKsbXh/9TTg07H/lTv3OlE2cOCF8JEDLf0d27FSJ/MAXA2+E+QDo=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4gT25lIGNvc21ldGljIGNvbW1lbnQgaW5saW5lLiBXaXRoIHRoYXQg
Zml4ZWQgdGhpcyANCnBhdGNoIGlzIFJldmlld2VkLWJ5OsKgIEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPg0KDQpPbiAyMDE5LTA2LTE0IDEyOjUxIHAubS4sIFN0RGVuaXMs
IFRvbSB3cm90ZToNCj4gT24gMzItYml0IGhvc3RzIG1lbS0+bnVtX3BhZ2VzIGlzIDMyLWJpdHMg
YW5kIGNhbiBvdmVyZmxvdw0KPiB3aGVuIHNoaWZ0ZWQuICBBZGQgYSBjYXN0IHRvIGF2b2lkIHRo
aXMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdy
LmMgfCA4ICsrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMNCj4gaW5kZXggYzk2M2FkODYwNzJlLi4zMTg5NWQzYzMzZGUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jDQo+IEBAIC0yNzks
MTQgKzI3OSwxNiBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4sDQo+ICAgCXVpbnQ2NF90IHZpc191c2FnZSA9IDA7DQo+ICAg
CXVuc2lnbmVkIGk7DQo+ICAgCWludCByOw0KPiArCXVpbnQ2NF90IG1lbV9ieXRlczsNCg0KQ2hy
aXN0aWFuIGxpa2VzIHRoZSAidXBzaWRlLWRvd24gY2hyaXN0bWFzIHRyZWUiIHRvIGhlbHAgcmVh
ZGFiaWxpdHkgb2YgDQpsb2NhbCB2YXJpYWJsZSBkZWNsYXJhdGlvbnMuDQoNCg0KPiAgIA0KPiAg
IAlscGZuID0gcGxhY2UtPmxwZm47DQo+ICAgCWlmICghbHBmbikNCj4gICAJCWxwZm4gPSBtYW4t
PnNpemU7DQo+ICAgDQo+ICAgCS8qIGJhaWwgb3V0IHF1aWNrbHkgaWYgdGhlcmUncyBsaWtlbHkg
bm90IGVub3VnaCBWUkFNIGZvciB0aGlzIEJPICovDQo+IC0JaWYgKGF0b21pYzY0X2FkZF9yZXR1
cm4obWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpID4gYWRldi0+Z21j
Lm1jX3ZyYW1fc2l6ZSkgew0KPiAtCQlhdG9taWM2NF9zdWIobWVtLT5udW1fcGFnZXMgPDwgUEFH
RV9TSElGVCwgJm1nci0+dXNhZ2UpOw0KPiArCW1lbV9ieXRlcyA9ICh1NjQpbWVtLT5udW1fcGFn
ZXMgPDwgUEFHRV9TSElGVDsNCj4gKwlpZiAoYXRvbWljNjRfYWRkX3JldHVybihtZW1fYnl0ZXMs
ICZtZ3ItPnVzYWdlKSA+IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsNCj4gKwkJYXRvbWljNjRf
c3ViKG1lbV9ieXRlcywgJm1nci0+dXNhZ2UpOw0KPiAgIAkJbWVtLT5tbV9ub2RlID0gTlVMTDsN
Cj4gICAJCXJldHVybiAwOw0KPiAgIAl9DQo+IEBAIC0zMDgsNyArMzEwLDcgQEAgc3RhdGljIGlu
dCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLA0K
PiAgIAlub2RlcyA9IGt2bWFsbG9jX2FycmF5KCh1aW50MzJfdCludW1fbm9kZXMsIHNpemVvZigq
bm9kZXMpLA0KPiAgIAkJCSAgICAgICBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7DQo+ICAgCWlm
ICghbm9kZXMpIHsNCj4gLQkJYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJ
RlQsICZtZ3ItPnVzYWdlKTsNCj4gKwkJYXRvbWljNjRfc3ViKG1lbV9ieXRlcywgJm1nci0+dXNh
Z2UpOw0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgCX0NCj4gICANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
