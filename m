Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97656755F
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 21:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171E56E36D;
	Fri, 12 Jul 2019 19:29:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780080.outbound.protection.outlook.com [40.107.78.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CAA6E36D
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 19:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyB3/SWO6f7Wsuk1yt5Z6p4YzLrs4JtkF0KaDMX9uHkFULyskdRGoEMi9WtWh+AknBXYsTHekT6DXHcNG2v+KZQLKVGrUQifHf3SnIsGllhZnxsN8tox2aGc0wWMYMbXTLHcwD0k+j8wI/mE5fNwHhPYxhRiXUq6kCDUVGu3xI0wtzz3e/GZncPC9/H+JCDb6RrrA2nLBrdgjaiPdIXOXNqr+MNghhhJizZrxOajhyJvOUchJ5jVn7lU81qMateSB08nvJosjSpKnUEunUx7h8Bi0hMGLJ5m5t98/8Ol7pprdoXeLV0mf5eZa6niOVkDLXGlX/szX4d3uWDT8ygv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwilLJibxVIHXr+Bkz335TMER+EEF3F+/Gep1TCT7AQ=;
 b=fS/2yZ2ySomGSG8nyqyGKO2YgI9j8as0aFRWlyoYc4DTGMAQpQ4c8vecT441F8tZSXUj5JpNCh6Vk8jMsLkcrDQu6Kq1CQ6JxbfNLtjhjoZIchBdP465atK0aCmFENxCSkE9LmVA5mam/0LpDOvFIErkqW1qxBYzse2bRUB7iLKEwLWKf5rNCc9IA9dJ/TUHlea+G2Pb9+QwPjVwxiuEIarlQfiEKJODH753UpLRvqE0FwYOm77VB91be2MC1rLNRdH7nW96kuQFZCyNk0tBUFXI+F3aUASnNCcfIW5TLCX9bWwbeHAOcmMXGTVz1iC4VEIyc0dJDOn8PsZGNLBCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2924.namprd12.prod.outlook.com (20.179.104.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 19:29:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Fri, 12 Jul 2019
 19:29:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Haehnle, Nicolai" <Nicolai.Haehnle@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/gfx10: set SH_MEM_CONFIG.INITIAL_INST_PREFETCH
Thread-Topic: [PATCH] drm/amdgpu/gfx10: set SH_MEM_CONFIG.INITIAL_INST_PREFETCH
Thread-Index: AQHVOLhGXtJhzv2nRkyNR6vj/6MCdqbHXuAA
Date: Fri, 12 Jul 2019 19:29:45 +0000
Message-ID: <80089ea5-a54d-0e51-3088-60f0e0a2cd0a@amd.com>
References: <20190712134642.68650-1-nicolai.haehnle@amd.com>
In-Reply-To: <20190712134642.68650-1-nicolai.haehnle@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af009ef9-0541-4c38-6a97-08d706ff4bf5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2924; 
x-ms-traffictypediagnostic: DM6PR12MB2924:
x-microsoft-antispam-prvs: <DM6PR12MB2924913149E650244C3262E592F20@DM6PR12MB2924.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(199004)(189003)(476003)(446003)(99286004)(316002)(71200400001)(386003)(71190400001)(25786009)(486006)(110136005)(58126008)(14444005)(2616005)(6506007)(8936002)(6246003)(256004)(7736002)(102836004)(11346002)(53936002)(305945005)(53546011)(478600001)(2501003)(66556008)(64756008)(66446008)(52116002)(66476007)(26005)(66946007)(66066001)(65956001)(65806001)(66574012)(64126003)(65826007)(5660300002)(6436002)(81166006)(8676002)(81156014)(186003)(76176011)(2906002)(6486002)(6512007)(14454004)(31696002)(86362001)(229853002)(36756003)(68736007)(31686004)(6116002)(3846002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2924;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GvvMRhwaxOeh0pqWai9Tj9Qqeo1Ps+0r/6anafzXXzwxSyhFeCbKUJFP4i/JgIzXg+todX938awXwT0RQOiRCF/LuDp6HDPCVbazfzpVxMjX+oBKuPSk01Gl3+tF3/sR1e49Ur+TAqA59V+Wi7S2iKFif9V+yOtyzEbdlN02AyKacB7heZdRFqZLLBj4EOn3I+rnl23PGiKqvrB40s6cdGBCo5/NmKrgB7ihFqRS0ABfp0IzWB5Mbzmi993RH45+3aKDiz8MTtzY25Qnv4M1wtVyUzKHLoFDBZzETOwhq80Ine7Htke4b19/iTvJYQTvo0lPZfxprl+PI5NU6H4cJ42MmFhPaUZ29nx1+phNpddwhL88Dloxttt8SGlypyiLZcer1LsnTbgmCMcUH9P/LgA05+Vp4ZdHeWEMIBFvt3Y=
Content-ID: <95AC6BFB979FFD4A957752065CD802BD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af009ef9-0541-4c38-6a97-08d706ff4bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 19:29:45.9964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwilLJibxVIHXr+Bkz335TMER+EEF3F+/Gep1TCT7AQ=;
 b=ErP5pnD4DrAyjr7otgbF5Q+wIpuJrt0wkyigvlD8j05mhPCufq1JfCJx34zgPdnx+4zS+7gCJdCsEfEgeWA8UQGAKTbyTRN4hJs/TVRIUdV4DCnCXys/9Tal/ajssbVBV4LFZvLjiessV8OHIU7z/v/i6ygiuYjT6IXsOwVbzcw=
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

T24gMjAxOS0wNy0xMiA5OjQ2IGEubS4sIEhhZWhubGUsIE5pY29sYWkgd3JvdGU6DQo+IFByZWZl
dGNoIG1vZGUgMCBpcyBub3Qgc3VwcG9ydGVkIGFuZCBjYW4gbGVhZCB0byBoYW5ncyB3aXRoIGNl
cnRhaW4gdmVyeQ0KPiBzcGVjaWZpYyBjb2RlIHBhdHRlcm5zLiBTZXQgYSBzb3VuZCBwcmVmZXRj
aCBtb2RlIGZvciBhbGwgVk1JRHMgcmF0aGVyDQo+IHRoYW4gZm9yY2luZyBhbGwgc2hhZGVycyB0
byBzZXQgdGhlIHByZWZldGNoIG1vZGUgYXQgdGhlIGJlZ2lubmluZy4NCj4NCj4gUmVkdWNlIGNv
ZGUgZHVwbGljYXRpb24gYSBiaXQgd2hpbGUgd2UncmUgYXQgaXQuIE5vdGUgdGhhdCB0aGUgNjQt
Yml0DQo+IGFkZHJlc3MgbW9kZSBlbnVtIGFuZCB0aGUgcmV0cnkgYWxsIGVudW0gYXJlIGJvdGgg
MCwgc28gdGhlIG9ubHkNCj4gZnVuY3Rpb25hbCBjaGFuZ2UgaXMgaW4gdGhlIElOSVRJQUxfSU5T
VF9QUkVGRVRDSCBmaWVsZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhaSBIw6RobmxlIDxu
aWNvbGFpLmhhZWhubGVAYW1kLmNvbT4NCkkgZm9yd2FyZGVkIHRoaXMgdG8gdGhlIGNvbXB1dGUg
Y29tcGlsZXIgdGVhbSBhcyB3ZWxsLiBUaGV5IGhhdmUgbm8gDQpvYmplY3Rpb25zIGFuZCBhZ3Jl
ZSB0aGlzIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4NCg0KQWNrZWQtYnk6IEZlbGl4IEt1ZWhs
aW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQoNCj4gLS0NCj4gSSBoYXZlbid0IGJlZW4g
YWJsZSB0byBwcm9wZXJseSB0ZXN0IHRoaXMgeWV0LCBidXQgaXQgaXMgdGhlIHJpZ2h0IHRoaW5n
DQo+IHRvIGJlIGRvaW5nIGluIHByaW5jaXBsZS4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAyNyArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCj4gaW5kZXggMGQ5NGM4MTJk
ZjFiLi5iODQ5OGMzNTkxOTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTBfMC5jDQo+IEBAIC0xNTcsMjAgKzE1NywyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1
X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2djXzEwXzFfMVtdID0NCj4gICAJU09DMTVfUkVH
X0dPTERFTl9WQUxVRShHQywgMCwgbW1UQV9DTlRMX0FVWCwgMHhmZmY3ZmZmZiwgMHgwMTAzMDAw
MCksDQo+ICAgCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVENQX0NOVEwsIDB4NjAw
MDAwMTAsIDB4NDc5YzAwMTApLA0KPiAgIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBt
bVVUQ0wxX0NUUkwsIDB4MDA4MDAwMDAsIDB4MDA4MDAwMDApLA0KPiAgIH07DQo+ICAgDQo+ICAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19nY18x
MF8xX252MTRbXSA9DQo+ICAgew0KPiAgIAkvKiBQZW5kaW5nIG9uIGVtdWxhdGlvbiBicmluZyB1
cCAqLw0KPiAgIH07DQo+ICAgDQo+ICsjZGVmaW5lIERFRkFVTFRfU0hfTUVNX0NPTkZJRyBcDQo+
ICsJKChTSF9NRU1fQUREUkVTU19NT0RFXzY0IDw8IFNIX01FTV9DT05GSUdfX0FERFJFU1NfTU9E
RV9fU0hJRlQpIHwgXA0KPiArCSAoU0hfTUVNX0FMSUdOTUVOVF9NT0RFX1VOQUxJR05FRCA8PCBT
SF9NRU1fQ09ORklHX19BTElHTk1FTlRfTU9ERV9fU0hJRlQpIHwgXA0KPiArCSAoU0hfTUVNX1JF
VFJZX01PREVfQUxMIDw8IFNIX01FTV9DT05GSUdfX1JFVFJZX01PREVfX1NISUZUKSB8IFwNCj4g
KwkgKDMgPDwgU0hfTUVNX0NPTkZJR19fSU5JVElBTF9JTlNUX1BSRUZFVENIX19TSElGVCkpDQo+
ICsNCj4gKw0KPiAgIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9zZXRfcmluZ19mdW5jcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF9pcnFf
ZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgIHN0YXRpYyB2b2lkIGdmeF92
MTBfMF9zZXRfZ2RzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgIHN0YXRp
YyB2b2lkIGdmeF92MTBfMF9zZXRfcmxjX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsNCj4gICBzdGF0aWMgaW50IGdmeF92MTBfMF9nZXRfY3VfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
YW1kZ3B1X2N1X2luZm8gKmN1X2luZm8pOw0KPiAgIHN0YXRpYyB1aW50NjRfdCBnZnhfdjEwXzBf
Z2V0X2dwdV9jbG9ja19jb3VudGVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gICBz
dGF0aWMgdm9pZCBnZnhfdjEwXzBfc2VsZWN0X3NlX3NoKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1MzIgc2VfbnVtLA0KPiAgIAkJCQkgICB1MzIgc2hfbnVtLCB1MzIgaW5zdGFuY2UpOw0K
PiAgIHN0YXRpYyB1MzIgZ2Z4X3YxMF8wX2dldF93Z3BfYWN0aXZlX2JpdG1hcF9wZXJfc2goc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiBAQCAtMTQ3Niw0MCArMTQ4MywzNSBAQCBzdGF0
aWMgdTMyIGdmeF92MTBfMF9pbml0X3BhX3NjX3RpbGVfc3RlZXJpbmdfb3ZlcnJpZGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZQ0KPiAgIAlyZXR1cm4gcGFfc2NfdGlsZV9zdGVlcmluZ19vdmVy
cmlkZTsNCj4gICB9DQo+ICAgDQo+ICAgI2RlZmluZSBERUZBVUxUX1NIX01FTV9CQVNFUwkoMHg2
MDAwKQ0KPiAgICNkZWZpbmUgRklSU1RfQ09NUFVURV9WTUlECSg4KQ0KPiAgICNkZWZpbmUgTEFT
VF9DT01QVVRFX1ZNSUQJKDE2KQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9pbml0
X2NvbXB1dGVfdm1pZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICB7DQo+ICAgCWlu
dCBpOw0KPiAtCXVpbnQzMl90IHNoX21lbV9jb25maWc7DQo+ICAgCXVpbnQzMl90IHNoX21lbV9i
YXNlczsNCj4gICANCj4gICAJLyoNCj4gICAJICogQ29uZmlndXJlIGFwZXJ0dXJlczoNCj4gICAJ
ICogTERTOiAgICAgICAgIDB4NjAwMDAwMDAnMDAwMDAwMDAgLSAweDYwMDAwMDAxJzAwMDAwMDAw
ICg0R0IpDQo+ICAgCSAqIFNjcmF0Y2g6ICAgICAweDYwMDAwMDAxJzAwMDAwMDAwIC0gMHg2MDAw
MDAwMicwMDAwMDAwMCAoNEdCKQ0KPiAgIAkgKiBHUFVWTTogICAgICAgMHg2MDAxMDAwMCcwMDAw
MDAwMCAtIDB4NjAwMjAwMDAnMDAwMDAwMDAgKDFUQikNCj4gICAJICovDQo+ICAgCXNoX21lbV9i
YXNlcyA9IERFRkFVTFRfU0hfTUVNX0JBU0VTIHwgKERFRkFVTFRfU0hfTUVNX0JBU0VTIDw8IDE2
KTsNCj4gICANCj4gLQlzaF9tZW1fY29uZmlnID0gU0hfTUVNX0FERFJFU1NfTU9ERV82NCB8DQo+
IC0JCQlTSF9NRU1fQUxJR05NRU5UX01PREVfVU5BTElHTkVEIDw8DQo+IC0JCQlTSF9NRU1fQ09O
RklHX19BTElHTk1FTlRfTU9ERV9fU0hJRlQ7DQo+IC0NCj4gICAJbXV0ZXhfbG9jaygmYWRldi0+
c3JibV9tdXRleCk7DQo+ICAgCWZvciAoaSA9IEZJUlNUX0NPTVBVVEVfVk1JRDsgaSA8IExBU1Rf
Q09NUFVURV9WTUlEOyBpKyspIHsNCj4gICAJCW52X2dyYm1fc2VsZWN0KGFkZXYsIDAsIDAsIDAs
IGkpOw0KPiAgIAkJLyogQ1AgYW5kIHNoYWRlcnMgKi8NCj4gLQkJV1JFRzMyX1NPQzE1KEdDLCAw
LCBtbVNIX01FTV9DT05GSUcsIHNoX21lbV9jb25maWcpOw0KPiArCQlXUkVHMzJfU09DMTUoR0Ms
IDAsIG1tU0hfTUVNX0NPTkZJRywgREVGQVVMVF9TSF9NRU1fQ09ORklHKTsNCj4gICAJCVdSRUcz
Ml9TT0MxNShHQywgMCwgbW1TSF9NRU1fQkFTRVMsIHNoX21lbV9iYXNlcyk7DQo+ICAgCX0NCj4g
ICAJbnZfZ3JibV9zZWxlY3QoYWRldiwgMCwgMCwgMCwgMCk7DQo+ICAgCW11dGV4X3VubG9jaygm
YWRldi0+c3JibV9tdXRleCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGdmeF92MTBf
MF90Y3BfaGFydmVzdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICB7DQo+ICAgCWlu
dCBpLCBqLCBrOw0KPiAgIAlpbnQgbWF4X3dncF9wZXJfc2ggPSBhZGV2LT5nZnguY29uZmlnLm1h
eF9jdV9wZXJfc2ggPj4gMTsNCj4gQEAgLTE1OTAsMzEgKzE1OTIsMjIgQEAgc3RhdGljIHZvaWQg
Z2Z4X3YxMF8wX2NvbnN0YW50c19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAg
IAlnZnhfdjEwXzBfZ2V0X2N1X2luZm8oYWRldiwgJmFkZXYtPmdmeC5jdV9pbmZvKTsNCj4gICAJ
YWRldi0+Z2Z4LmNvbmZpZy5wYV9zY190aWxlX3N0ZWVyaW5nX292ZXJyaWRlID0NCj4gICAJCWdm
eF92MTBfMF9pbml0X3BhX3NjX3RpbGVfc3RlZXJpbmdfb3ZlcnJpZGUoYWRldik7DQo+ICAgDQo+
ICAgCS8qIFhYWCBTSF9NRU0gcmVncyAqLw0KPiAgIAkvKiB3aGVyZSB0byBwdXQgTERTLCBzY3Jh
dGNoLCBHUFVWTSBpbiBGU0E2NCBzcGFjZSAqLw0KPiAgIAltdXRleF9sb2NrKCZhZGV2LT5zcmJt
X211dGV4KTsNCj4gICAJZm9yIChpID0gMDsgaSA8IGFkZXYtPnZtX21hbmFnZXIuaWRfbWdyW0FN
REdQVV9HRlhIVUJdLm51bV9pZHM7IGkrKykgew0KPiAgIAkJbnZfZ3JibV9zZWxlY3QoYWRldiwg
MCwgMCwgMCwgaSk7DQo+ICAgCQkvKiBDUCBhbmQgc2hhZGVycyAqLw0KPiAtCQlpZiAoaSA9PSAw
KSB7DQo+IC0JCQl0bXAgPSBSRUdfU0VUX0ZJRUxEKDAsIFNIX01FTV9DT05GSUcsIEFMSUdOTUVO
VF9NT0RFLA0KPiAtCQkJCQkgICAgU0hfTUVNX0FMSUdOTUVOVF9NT0RFX1VOQUxJR05FRCk7DQo+
IC0JCQl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgU0hfTUVNX0NPTkZJRywgUkVUUllfTU9ERSwg
MCk7DQo+IC0JCQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tU0hfTUVNX0NPTkZJRywgdG1wKTsNCj4g
LQkJCVdSRUczMl9TT0MxNShHQywgMCwgbW1TSF9NRU1fQkFTRVMsIDApOw0KPiAtCQl9IGVsc2Ug
ew0KPiAtCQkJdG1wID0gUkVHX1NFVF9GSUVMRCgwLCBTSF9NRU1fQ09ORklHLCBBTElHTk1FTlRf
TU9ERSwNCj4gLQkJCQkJICAgIFNIX01FTV9BTElHTk1FTlRfTU9ERV9VTkFMSUdORUQpOw0KPiAt
CQkJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFNIX01FTV9DT05GSUcsIFJFVFJZX01PREUsIDAp
Ow0KPiAtCQkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVNIX01FTV9DT05GSUcsIHRtcCk7DQo+ICsJ
CVdSRUczMl9TT0MxNShHQywgMCwgbW1TSF9NRU1fQ09ORklHLCBERUZBVUxUX1NIX01FTV9DT05G
SUcpOw0KPiArCQlpZiAoaSAhPSAwKSB7DQo+ICAgCQkJdG1wID0gUkVHX1NFVF9GSUVMRCgwLCBT
SF9NRU1fQkFTRVMsIFBSSVZBVEVfQkFTRSwNCj4gICAJCQkJKGFkZXYtPmdtYy5wcml2YXRlX2Fw
ZXJ0dXJlX3N0YXJ0ID4+IDQ4KSk7DQo+ICAgCQkJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFNI
X01FTV9CQVNFUywgU0hBUkVEX0JBU0UsDQo+ICAgCQkJCShhZGV2LT5nbWMuc2hhcmVkX2FwZXJ0
dXJlX3N0YXJ0ID4+IDQ4KSk7DQo+ICAgCQkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVNIX01FTV9C
QVNFUywgdG1wKTsNCj4gICAJCX0NCj4gICAJfQ0KPiAgIAludl9ncmJtX3NlbGVjdChhZGV2LCAw
LCAwLCAwLCAwKTsNCj4gICANCj4gICAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
