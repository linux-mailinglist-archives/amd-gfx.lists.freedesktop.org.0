Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7996BEDE
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ED96E0F8;
	Wed, 17 Jul 2019 15:14:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720052.outbound.protection.outlook.com [40.107.72.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7D6E0F8
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 15:14:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeV7DDROBpKQJtCSAhf5iygg4h/qm6V1IEOxIKwKHWcUGz8Zrxwf9FN4ibBf9CMbYO4UX7VsOpdGCteBCNM5DX22OQk54RlSyvyGLis9NUxjeF6SFxcgRKcPFm14mdO2Eu9/fDzpvmBlgiGApCIJqVvQLkDQ41FpCaaO45W9A2I1ZLIk+izf3uDAdSeB2MDwRBCbpqhBJwlAvKSbeFdUkdSBwCZ7iz6A4QT+Hp1YtFcCbvGH2WqKU2fH38EyE3xKyIIeUkYoBoOYWNGKuYAmScaDH8I6Uihdyl7wcMoAxgtF88UqLugCYknO+VqvLed37sVD6B4t9eoB3aVdPFpi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzkW1ABppX9VZalmgIrwAky9+IV40YPyNrIiCVjmH7A=;
 b=b+vyzQrXpWsiE4NViEQcKqWeagEAVBO6xQJ2MAREZE7X33sulx5P8/52lZTt08mwyiisvz8Funcf15fW9+u62qjMMX9fOBq3nj6+o43ugyvJcD5FAYrdkFWh/uPiJ0zax6R1LLE+8xnow8Je4A84NKM6fszugyAzRNBDVhHjEVywzaVM18aiR6v/D7pl3XxhmmL1ugc2Ejt7Vqefj6LUmWgkTu2QEbBFTJOHaQzTwiXxRL5/tvfqnWkyayM/o2aF7PSjocHnMSH+Ju2K1/njigBK3oz5tuYTTx2kEcoFvjPBcTtLO8qXZNz8iaf1QiWFlGjrVdk+G4n/zSks1cRcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3500.namprd12.prod.outlook.com (20.178.199.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 15:14:49 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 15:14:49 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Remove GWS from process during uninit
Thread-Topic: [PATCH] drm/amdkfd: Remove GWS from process during uninit
Thread-Index: AQHVPLAo//Ju2ecqbU6HA1LmDKhu16bO60YA
Date: Wed, 17 Jul 2019 15:14:49 +0000
Message-ID: <a02194c5-42f9-1a1a-5124-727b1a6078ad@amd.com>
References: <20190717145830.9004-1-Joseph.Greathouse@amd.com>
In-Reply-To: <20190717145830.9004-1-Joseph.Greathouse@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [142.127.174.106]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::32) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 663e7819-e8e0-4138-fb5c-08d70ac982ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3500; 
x-ms-traffictypediagnostic: DM6PR12MB3500:
x-microsoft-antispam-prvs: <DM6PR12MB35000903552D86F8A26FA3C592C90@DM6PR12MB3500.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(189003)(199004)(3846002)(256004)(81166006)(99286004)(6246003)(486006)(58126008)(110136005)(66066001)(6486002)(2906002)(65956001)(6512007)(71190400001)(36756003)(25786009)(53936002)(446003)(31686004)(6116002)(8936002)(2501003)(71200400001)(14454004)(68736007)(52116002)(64126003)(65826007)(81156014)(7736002)(305945005)(478600001)(8676002)(102836004)(66446008)(5660300002)(6436002)(186003)(2616005)(229853002)(11346002)(86362001)(65806001)(26005)(476003)(66556008)(31696002)(66946007)(6506007)(53546011)(64756008)(66476007)(76176011)(316002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3500;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JbZTSPZ+CzwDA4E42Qv33ny6JTYBbPgde7SK+pa7X3P0RS4Z+H4pg93huuEWQ5sANy+dH+TD5E/sdXu+96Qqoodtk2aHGGKcAAZWDwYWI5V5EQ7sf4sOrvdfeC/3+umskmnzUjyfPBvGQGIA1N88zncvcOEZchY+8eLkQuHPmIJi0d52FkvLC2Lkg//xRZZWklWegI2+V3oKc/ii2ArdTBxiSEbiYk/iQHEu7kyEOdKY4CESRKk+eMkjyjr/wQ0trBBrBbZnSeiQ3PQ8M3lMVDYLWHCqjzaZjMZGMk70erHlvplJ4FH1wUsy2cu/uqZQJkgLnUnDdm1M1qNBPflWfEvnTnVjj8nG2jv8Dm4L4lpSXVH904bPp1R75Y86WGyaBWF0jLscoT+zDAlh3IKaBf1clwubCUTOGEZ469yd6o0=
Content-ID: <E6E06AA45BAE384EBB98D620BADFBDE6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663e7819-e8e0-4138-fb5c-08d70ac982ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 15:14:49.6482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3500
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzkW1ABppX9VZalmgIrwAky9+IV40YPyNrIiCVjmH7A=;
 b=OTmV+rOjso3SVhnAmV6uKYXmh3D984OIwDotR5fmk8wtDXNVFqy4+uKmGl71Y8btG79SXsE8BgcW7G4ioZlFXzVRmx3HePO/7leaBr1qK9SO81k1PnKatCnze4vx4gFRPtcY+Nmjt8iQa0xjpIziuGAi5vsJ9F8zh10wR1jzRAE=
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

T24gMjAxOS0wNy0xNyAxMDo1OCwgR3JlYXRob3VzZSwgSm9zZXBoIHdyb3RlOg0KPiBJZiB3ZSBz
aHV0IGRvd24gYSBwcm9jZXNzIHdpdGhvdXQgaGF2aW5nIGRlc3Ryb3llZCBpdHMgR1dTLXVzaW5n
DQo+IHF1ZXVlcywgaXQgaXMgcG9zc2libGUgdGhhdCBHV1MgQk8gd2lsbCBzdGlsbCBiZSBpbiB0
aGUgcHJvY2Vzcw0KPiBCTyBsaXN0IGR1cmluZyB0aGUgZ3B1dm0gZGVzdHJ1Y3Rpb24uIFRoaXMg
bGlzdCBzaG91bGQgYmUgZW1wdHkNCj4gYXQgdGhhdCB0aW1lLCBzbyB3ZSBzaG91bGQgcmVtb3Zl
IHRoZSBHV1MgYWxsb2NhdGlvbiBhdCB0aGUNCj4gcHJvY2VzcyB1bmluaXQgcG9pbnQgaWYgaXQg
aXMgc3RpbGwgYXJvdW5kLg0KPg0KPiBDaGFuZ2UtSWQ6IEkwOThlN2IzMTUwNzBkZDViMDE2NWJi
NzkwNWFlZjY0MzQ1MGYyN2YyDQo+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBHcmVhdGhvdXNlIDxK
b3NlcGguR3JlYXRob3VzZUBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgfCAzICsrKw0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiBpbmRleCBkYTA5
NTg2MjU4NjEuLjdlNmMzZWU4MmY1YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiBAQCAtMTUwLDYg
KzE1MCw5IEBAIHZvaWQgcHFtX3VuaW5pdChzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpw
cW0pDQo+ICAgCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKnBxbiwgKm5leHQ7DQo+ICAgDQo+
ICAgCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShwcW4sIG5leHQsICZwcW0tPnF1ZXVlcywgcHJv
Y2Vzc19xdWV1ZV9saXN0KSB7DQo+ICsJCWlmIChwcW4tPnEgJiYgcHFuLT5xLT5nd3MpDQo+ICsJ
CQlhbWRncHVfYW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9wcm9jZXNzKHBxbS0+cHJvY2Vzcy0+a2dk
X3Byb2Nlc3NfaW5mbywNCj4gKwkJCQlwcW4tPnEtPmd3cyk7DQo+ICAgCQl1bmluaXRfcXVldWUo
cHFuLT5xKTsNCj4gICAJCWxpc3RfZGVsKCZwcW4tPnByb2Nlc3NfcXVldWVfbGlzdCk7DQo+ICAg
CQlrZnJlZShwcW4pOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
