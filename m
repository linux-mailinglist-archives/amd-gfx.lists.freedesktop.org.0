Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9BAAB5D
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 20:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1E46E0EE;
	Thu,  5 Sep 2019 18:46:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680059.outbound.protection.outlook.com [40.107.68.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514F6E0EE
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 18:46:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGMHIQPSDfMo67Y6gOYUeEqQxQEHKw1xwiTuN+btUdYe9NOeZalT8gXxluAu6djfLQ2r/JESoPLiXNSYIwYUX2WIZBxTy9hiNhbn5ZZ7aXtDPx3FAEA5Dst43iqNmHvcrtyXm9aCN7YF9Ps9YmeJtDJRTvPFYqQ8C9khILJdmurU3vREGWh/2FR49LLZfTDWH2rfrZzIfDswNGlPPHV6tFl8ODOODsAy6IITBt1SryJ++e5HkRQucDZMlvQMolddjUNS8y7DkxApzH40GScnXyv1NEpMsF2lCIAm6hk3SdGLc/1hMaLKf7FpnQpKB7S9s5KcKvWrujm1zEExo8M4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeWABz30jR81ROubF/QcFe9L5i83ugkDCg0rKIaSbCI=;
 b=Wzp6xkOf1oisA6CnSywAbOfaYXLKJhKL4Yi+N23/SjpC2vSYwt97jv/brQKmW+DeGvf8mB3yrPIuWCDyphwHz8oM9B3GtTyKt0PIvZkiulhowEVfCtnggF+rBFT3XG55Po2tx2aY66E5GnQSj/Ct5EtTuKCvA0ghM7Rt+L4f/N2F0KaLQaLA1s9Bak4KIaNpo78ZtmcKwJ+mNNhExvpBYjhhQF6pjXIydx3xxY1cTqTRTRBSKYnCQ/6i1UJ0YGpNuDtq1LpP68fsxao44kTuJaWdiJvxSkww20iAKW3yGa8kza9HWZ7nyhWpeB81ClotmkBmTqf3PRs81yD+SpIDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3340.namprd12.prod.outlook.com (20.178.31.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 5 Sep 2019 18:46:14 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 18:46:14 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 02/10] drm/amdkfd: add renoir kfd device info (v2)
Thread-Topic: [PATCH v2 02/10] drm/amdkfd: add renoir kfd device info (v2)
Thread-Index: AQHVZBjmNBFBrLjIkkOa+1YHwAlMoKcdbCcA
Date: Thu, 5 Sep 2019 18:46:14 +0000
Message-ID: <e2ef31a3-5aa4-3a30-05e0-012f78d9c384@amd.com>
References: <1567708597-18831-1-git-send-email-ray.huang@amd.com>
 <1567708597-18831-2-git-send-email-ray.huang@amd.com>
In-Reply-To: <1567708597-18831-2-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::40) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c03611c-37f7-4572-2e1f-08d7323153f6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3340; 
x-ms-traffictypediagnostic: DM6PR12MB3340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB334083506A3370DE57530FEA92BB0@DM6PR12MB3340.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(189003)(199004)(229853002)(4326008)(6246003)(53936002)(386003)(53546011)(6506007)(8676002)(26005)(65956001)(5660300002)(102836004)(6116002)(6436002)(3846002)(186003)(76176011)(66066001)(478600001)(6512007)(31696002)(31686004)(86362001)(14454004)(256004)(486006)(81166006)(316002)(25786009)(99286004)(54906003)(66946007)(2906002)(446003)(11346002)(476003)(52116002)(110136005)(65806001)(6486002)(2616005)(8936002)(305945005)(36756003)(2501003)(81156014)(66476007)(71200400001)(71190400001)(66556008)(58126008)(64756008)(66446008)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3340;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0+D0hQ20Yg3vVYrq6aVBjljGW7DgYS264opnZOl9Um5PhO390bfpRi3tpLfq5mDGSrnz3Dya/E1pXgX+kSF8WnQjiIRvwhhPAnZM4PG9O5PuN+VHGOeEO3X4CWAFOkkd4P0KEPcHvvtJYtZagStnpE9nHcEkMvYdUmmpTShWbYZrttJ3b8nHzzD2rfLiOgnsqRFDhB52SSU3AGdM3JtOKYPk8fUrxUQDWELysDgYyzC7YyB9WOZtMMeIfKcfAByEAur5/SJyLHup+K+DOHe8eamT+iKSE/q7FFCq99TmYhqsAHJK4jQGr9XE6Fo9Qfi0y2qe8dJcaFU1rML8gLX36uAlgaCMlet4oQBWylOW8+WycUTA7Ubo2fwPtnUB8c8TctWb6HOoFkp2vMhnKo2ASHnP8mD6npf9B3Sov/Oa9c4=
Content-ID: <8E2EBBBC7E07BE44910509036570081F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c03611c-37f7-4572-2e1f-08d7323153f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 18:46:14.2881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8NwmmprbTWYH3IEVWEIpOb6BIrPW9DKB8GQE/a1RYQhfpv5Z9eyuqZsBOSHUrDRj/uHMWGuu2YS5WXbfwz4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeWABz30jR81ROubF/QcFe9L5i83ugkDCg0rKIaSbCI=;
 b=R5QDPtuio9aZnAfrPujNesEDiORnuvR34hANhbvymLFXqY/g/hh5uU2nfZ034jjY50tWhBXrc4/hfPLEb2pDHgDu776gsvYpwkc4vGc6nYlMji/d1Bl8Po86M4TjyAuuuMCZ0f3OgXIESljrMLO1HBBgnWZjaYxmlFUowGM6ZAc=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wNSAyOjM2IHAubS4sIEh1YW5nLCBSYXkgd3JvdGU6DQo+IFRoaXMgcGF0Y2gg
aW5pdHMgcmVub2lyIGtmZCBkZXZpY2UgaW5mbywgc28gd2UgdHJlYXQgcmVub2lyIGFzICJkZ3B1
Ig0KPiAoYnlwYXNzIGlvbW11IHYyKS4gV2lsbCBlbmFibGUgbmVlZHNfaW9tbXVfZGV2aWNlIHRp
bGwgcmVub2lyIGlvbW11IGlzIHJlYWR5Lg0KPg0KPiB2MjogcmViYXNlIGFuZCBhbGlnbiB0aGUg
ZHJtLW5leHQNCj4NCj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NCg0KVGhlIHNlcmllcyBpcw0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCk5vdGUgdGhhdCB5b3UnbGwgbmVlZCB0byByZWJhc2UgdGhp
cyBwYXRjaCBhZ2FpbiBhZnRlciBZb25nJ3MgZml4IGZvciANCmJ1aWxkcyB3aXRob3V0IElPTU1V
djIgc3VwcG9ydC4gVGhlIENISVBfUkFWRU4gZW50cnkgaW4gdGhlIGRldmljZSB0YWJsZSANCm1v
dmVkLiBDSElQX1JFTk9JUiBzaG91bGQgc3RheSB3aGVyZSBpdCBpcywgYmVjYXVzZSBmb3Igbm93
IFJlbm9pciANCnN1cHBvcnQgZG9lc24ndCBkZXBlbmQgb24gSU9NTVV2Mi4NCg0KUmVnYXJkcywN
CiDCoCBGZWxpeA0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Uu
Yw0KPiBpbmRleCAyNjdlYjJlLi5jNTEyMGYzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jDQo+IEBAIC0zNTEsNiArMzUxLDIzIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qga2ZkX2RldmljZV9pbmZvIGFyY3R1cnVzX2RldmljZV9pbmZvID0gew0KPiAgIAkubnVt
X3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LA0KPiAgIH07DQo+ICAgDQo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyByZW5vaXJfZGV2aWNlX2luZm8gPSB7DQo+ICsJLmFz
aWNfZmFtaWx5ID0gQ0hJUF9SRU5PSVIsDQo+ICsJLm1heF9wYXNpZF9iaXRzID0gMTYsDQo+ICsJ
Lm1heF9ub19vZl9ocWQgID0gMjQsDQo+ICsJLmRvb3JiZWxsX3NpemUgID0gOCwNCj4gKwkuaWhf
cmluZ19lbnRyeV9zaXplID0gOCAqIHNpemVvZih1aW50MzJfdCksDQo+ICsJLmV2ZW50X2ludGVy
cnVwdF9jbGFzcyA9ICZldmVudF9pbnRlcnJ1cHRfY2xhc3NfdjksDQo+ICsJLm51bV9vZl93YXRj
aF9wb2ludHMgPSA0LA0KPiArCS5tcWRfc2l6ZV9hbGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwN
Cj4gKwkuc3VwcG9ydHNfY3dzciA9IHRydWUsDQo+ICsJLm5lZWRzX2lvbW11X2RldmljZSA9IGZh
bHNlLA0KPiArCS5uZWVkc19wY2lfYXRvbWljcyA9IGZhbHNlLA0KPiArCS5udW1fc2RtYV9lbmdp
bmVzID0gMSwNCj4gKwkubnVtX3hnbWlfc2RtYV9lbmdpbmVzID0gMCwNCj4gKwkubnVtX3NkbWFf
cXVldWVzX3Blcl9lbmdpbmUgPSAyLA0KPiArfTsNCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxMF9kZXZpY2VfaW5mbyA9IHsNCj4gICAJLmFzaWNfZmFt
aWx5ID0gQ0hJUF9OQVZJMTAsDQo+ICAgCS5hc2ljX25hbWUgPSAibmF2aTEwIiwNCj4gQEAgLTM4
NCw2ICs0MDEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyAqa2ZkX3N1
cHBvcnRlZF9kZXZpY2VzW11bMl0gPSB7DQo+ICAgCVtDSElQX1ZFR0ExMl0gPSB7JnZlZ2ExMl9k
ZXZpY2VfaW5mbywgTlVMTH0sDQo+ICAgCVtDSElQX1ZFR0EyMF0gPSB7JnZlZ2EyMF9kZXZpY2Vf
aW5mbywgTlVMTH0sDQo+ICAgCVtDSElQX1JBVkVOXSA9IHsmcmF2ZW5fZGV2aWNlX2luZm8sIE5V
TEx9LA0KPiArCVtDSElQX1JFTk9JUl0gPSB7JnJlbm9pcl9kZXZpY2VfaW5mbywgTlVMTH0sDQo+
ICAgCVtDSElQX0FSQ1RVUlVTXSA9IHsmYXJjdHVydXNfZGV2aWNlX2luZm8sICZhcmN0dXJ1c19k
ZXZpY2VfaW5mb30sDQo+ICAgCVtDSElQX05BVkkxMF0gPSB7Jm5hdmkxMF9kZXZpY2VfaW5mbywg
TlVMTH0sDQo+ICAgfTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
