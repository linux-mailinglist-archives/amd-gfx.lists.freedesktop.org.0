Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1CCBE73
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 17:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4666A6EBC0;
	Fri,  4 Oct 2019 15:02:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800045.outbound.protection.outlook.com [40.107.80.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF466EBC0
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 15:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoxaHjd4DISBp++qMFelR2qZm3yK4yMeu2aUErA+17woUEwY5JtSk4ztyVsXkmcfjHUzvjFGt4PVRYMJyEOHgj2pCggqjawSX2D/nJu4Ec5UzWMVrnaimhMRGj5z0gGuqXFsXNgEqIiuKG2waR9zBjH1cT9GSy8egJQPnuWlSD/g4+Gg0PdhVOpdID3ACbnjmV2wOn98fqgw420DUPsxAO5R15rpsz0wv9RSzKrfeOmfuO8zUUi+ZIzSW1IDiEnKQ8+XxX7iI3GYCzwrqFjlRLaVZfeEIlBfqRUoa7GZk7bLBUmJlyot33M88iKxzrLjF4bR3sMYkfF9BqtdNc5EEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAXiaAs4zq+qK0u/gtgAUUFKzdTQPWSeDJ/c01DImEg=;
 b=kJkTiIWL8FpXRVsZTGFUaxG6Tz4GFN3rcK1nTpQX5C1plxjLwIaReCRg8A1DzJ1PXfdYUwSoUwocjELC7/aDVrnHu+dJafWRdezyZVHIYx4gLJbXqaNelbAC16dP2axzh3YFzkuIEAL+2FhsLaOMN7VfwT+M/ri3VYsVBqbFyLCCC37HfyywvqbTKCI5TtXx0F/VR4HmsBehUCak39hC1eH738jWrltTDJL8ZJvKUOUDch3xDBmNV0+M0IemXKZv+QbwqihIMkXAb8hACtPygb05zcXPqMab8cIQxH5k480gEigs89VuC8gHmNDcn2hc2dLyrUaFCI3SSFZNU3rM2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2937.namprd12.prod.outlook.com (20.179.104.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 4 Oct 2019 15:02:32 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a%5]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 15:02:32 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Topic: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Index: AQHVby+cOrlga564PUeguQaR/P1as6dKqVOQgAABygA=
Date: Fri, 4 Oct 2019 15:02:32 +0000
Message-ID: <79b8aa8b-1e0c-643e-266f-45239592b6b1@amd.com>
References: <1568927828-17593-1-git-send-email-Oak.Zeng@amd.com>
 <BL0PR12MB2580DFF062B6AE6A61C3AFBC809E0@BL0PR12MB2580.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB2580DFF062B6AE6A61C3AFBC809E0@BL0PR12MB2580.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54f87cee-5be9-402b-06ca-08d748dbe1e0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2937:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2937ECD9C6C4455E90721BFA929E0@DM6PR12MB2937.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(13464003)(189003)(199004)(6116002)(3846002)(5660300002)(14444005)(256004)(31686004)(2906002)(65956001)(71200400001)(66066001)(71190400001)(65806001)(6486002)(486006)(81166006)(8936002)(8676002)(476003)(11346002)(229853002)(2616005)(446003)(102836004)(81156014)(52116002)(76176011)(386003)(53546011)(6506007)(186003)(305945005)(26005)(7736002)(36756003)(25786009)(478600001)(4326008)(14454004)(58126008)(86362001)(6436002)(2501003)(66446008)(66476007)(66946007)(66556008)(6512007)(64756008)(6246003)(316002)(110136005)(99286004)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2937;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mpbCrscQEUbK0OXknd864/lowb4TwL8UqP0+xHZopgX2uLJwE9pM/uy43QpSP+JZemUknIA4e2oFbc1mbi9OE/lbuVnI5ZAZ6ePdP33xL02J5fnURkl9ycm/IIFTq1hRuU+eQ9Z2oqaNxmfDgF0aaN7x5yyzKWZRfNzQkAdmBbKRHyUg8HIJqzu+sCHpTx04R76edP9lXz3dAqSjGj/qp0cfKgwzxG85T/q9FBUQ11iYW7yvAO4qmKXGcaboYvGG0rWbOuddIuOsEVnk/nf+PLV0SBWZZaGqoysaa2BhclS2BKvR1p14Y/Qgbp9jzsL9IU9tJgfDoUrD58XCa1eivvhAff+3/9865Mv6Q0VEn8SfmEURNH+Dqj4dJV9u5GMx0Dm69kThkgCimE1zFm7GxiOjwkfMLD9co+/Gv9fUq6o=
Content-ID: <D54FC6EC30B6CD4289C7AAF51AF615F0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f87cee-5be9-402b-06ca-08d748dbe1e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 15:02:32.3636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUxwyRIHQ/pQQkAHpoIZysqbHKnJpq9yViEyZOhv2LaI9zuSdtcMranhubQY8ruX+D6txt1CqHc6mrxmTxbypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAXiaAs4zq+qK0u/gtgAUUFKzdTQPWSeDJ/c01DImEg=;
 b=R0Z4ZADwrmGZxfQC6ClqqnRLpFv5onF2gmWCyMXS5hjOPQiiA1bvlXlM0do3h5oVgV35k0LeBp1mJooz++S6YH77ccQ+Tz1d69ZFuRkGbI0FGj+StWVgN+0952xyv7bZEXh2zoyU/9h+ad+uozFQCWmiK/YspRSRM26637f629Q=
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSdtIHByZXR0eSBzdXJlIHRoZSBnYXJ0X2VuYWJsZSBmdW5jdGlvbiBpcyBub3QgdGhlIHJpZ2h0
IHBsYWNlIGZvciANCnRoaXMuIEdBUlQgaXMgZm9yIEdQVSBhY2Nlc3MgdG8gc3lzdGVtIG1lbW9y
eS4gSERQIGlzIGZvciBob3N0IGFjY2VzcyB0byANCkdQVSBtZW1vcnkuIEFsc28sIEkgd291bGQg
ZXhwZWN0IGFueXRoaW5nIGRvbmUgaW4gZ2FydF9lbmFibGUgdG8gYmUgDQp1bmRvbmUgaW4gZ2Fy
dF9kaXNhYmxlLiBJZiB0aGF0J3Mgbm90IHRoZSBpbnRlbnRpb24sIG1heWJlIHRoaXMgc2hvdWxk
IA0KZ28gaW4gZ21jX3Y5XzBfaHdfaW5pdC4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQpPbiAy
MDE5LTEwLTA0IDEwOjU2LCBaZW5nLCBPYWsgd3JvdGU6DQo+IFBpbmcuLi4NCj4NCj4gUmVnYXJk
cywNCj4gT2FrDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFplbmcs
IE9hayA8T2FrLlplbmdAYW1kLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxOSwg
MjAxOSA1OjE3IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
S3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3Rp
YW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFplbmcsIE9hayA8T2FrLlplbmdAYW1kLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBFbmFibGUgZ2Z4IGNhY2hlIHByb2Jp
bmcgb24gSERQIHdyaXRlIGZvciBhcmN0dXJ1cw0KPg0KPiBUaGlzIGFsbG93cyBnZnggY2FjaGUg
dG8gYmUgcHJvYmVkIGFuZCBpbnZhbGlkYXRlZCAoZm9yIG5vbmUtZGlydHkgY2FjaGUgbGluZXMp
IG9uIGEgSERQIHdyaXRlIChmcm9tIGVpdGhlciBhbm90aGVyIEdQVSBvciBDUFUpLiBUaGlzIHNo
b3VsZCB3b3JrIG9ubHkgZm9yIHRoZSBtZW1vcnkgbWFwcGVkIGFzIFJXIG1lbW9yeSB0eXBlIG5l
d2x5IGFkZGVkIGZvciBhcmN0dXJ1cywgdG8gYWNoaWV2ZSBzb21lIGNhY2hlIGNvaGVyZW5jZSBi
L3QgbXVsdGlwbGUgbWVtb3J5IGNsaWVudHMuDQo+DQo+IENoYW5nZS1JZDogSTBhNjlkMDAwMGU0
ODcwNmJiNzEzMjM1YmZiYzgzZmNjNjc3NzQ2MTQNCj4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcg
PE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+IGluZGV4IDU3ZDc2ZWUu
LmUwMWEzNTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBA
QCAtMTI3Miw2ICsxMjcyLDkgQEAgc3RhdGljIGludCBnbWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJCS8qIFRPRE8gZm9yIHJlbm9pciAqLw0KPiAg
IAkJbW1odWJfdjFfMF91cGRhdGVfcG93ZXJfZ2F0aW5nKGFkZXYsIHRydWUpOw0KPiAgIAkJYnJl
YWs7DQo+ICsJY2FzZSBDSElQX0FSQ1RVUlVTOg0KPiArCQlXUkVHMzJfRklFTEQxNShIRFAsIDAs
IEhEUF9NTUhVQl9DTlRMLCBIRFBfTU1IVUJfR0NDLCAxKTsNCj4gKwkJYnJlYWs7DQo+ICAgCWRl
ZmF1bHQ6DQo+ICAgCQlicmVhazsNCj4gICAJfQ0KPiAtLQ0KPiAyLjcuNA0KPg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
