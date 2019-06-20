Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D584DA3A
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 21:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF846E4D2;
	Thu, 20 Jun 2019 19:34:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710080.outbound.protection.outlook.com [40.107.71.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A226E4D2
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 19:34:22 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3211.namprd12.prod.outlook.com (20.179.105.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 20 Jun 2019 19:34:21 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 19:34:21 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Topic: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Index: AQHVJ510MSBuJg2pPEm3H7nb3OJCdKak6/4wgAADFYA=
Date: Thu, 20 Jun 2019 19:34:21 +0000
Message-ID: <2d78acdf-7d6c-d0c5-8fe0-ff26dc7ce3cb@amd.com>
References: <20190620192155.20226-1-Felix.Kuehling@amd.com>
 <BL0PR12MB2580EA675A1B1F9AE6EC4B3F80E40@BL0PR12MB2580.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB2580EA675A1B1F9AE6EC4B3F80E40@BL0PR12MB2580.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96287671-debd-4a3b-cd68-08d6f5b64ace
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3211; 
x-ms-traffictypediagnostic: DM6PR12MB3211:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB32115A9DCE8152F0F09A080192E40@DM6PR12MB3211.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(366004)(136003)(13464003)(189003)(199004)(65826007)(476003)(6116002)(2501003)(7736002)(2616005)(11346002)(486006)(305945005)(76176011)(64756008)(66066001)(66556008)(66446008)(3846002)(66476007)(66946007)(446003)(73956011)(64126003)(65956001)(65806001)(6506007)(72206003)(14444005)(478600001)(25786009)(26005)(186003)(6246003)(6486002)(71200400001)(71190400001)(256004)(31696002)(31686004)(5660300002)(229853002)(6436002)(316002)(68736007)(14454004)(6306002)(86362001)(6512007)(99286004)(58126008)(102836004)(8676002)(81166006)(8936002)(110136005)(81156014)(966005)(53546011)(52116002)(36756003)(2906002)(386003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3211;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: le3bKKtfSBMzbkSmbSUtbDR0LCfOdm3qS6pmORrc1+Fc6m7eH9jbPexx0gSXaItxZgcMtUUynyiCLcZ/isGA1RFymt6ANbARNdIeywCFefkPVM/uTiVBiQ44etvOX2D+psedGx+I7KSng0XR1+siuI6rOw7GR4WxLaL2iVsFyA9r3CxYtDJk2sSGAxVCnJNTVIw749d3uMPEbsQ2ZdC1qh4R2o7cul0g8vVLRkRRXQmgz0SMajWDCQbwYu0Zklz6m6fs6GfbOFh8HS6AmNETSmlyod9Y7mxfcjw22zhYvoS5mqG+v6cObFUlw0l7RGF8HAiA4Dp1aR5FylUOx/LFap/qyafZ+ZH2tlTl42Fwr9OdbC9L5MTqx0Mgzks3beL68Xm3YzoLHc0LLLK5pP8vwCQ98zYkozBwGLjxl/M4AKE=
Content-ID: <BF5DEB8F5CDA5849B3D039FA64E51BAF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96287671-debd-4a3b-cd68-08d6f5b64ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 19:34:21.1881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN4MdBoGAw6pFrpCiucLuxNCR3xnf0NkXnr8sG+AzHQ=;
 b=1KUHQyAct/b5JmdVkyP6BKNYSlBMQnt2939YPLruabJgglBNOF+5sd4nvbVdqv2jNMcf4SbdzMDOohh8yH0JIy/g4F7sCqlqL+7RnRWuOo7l7kaFgbDc6LNsHFnp3B8hIVxWKHf2YGj5oMO6dTASJTr0UVPr//K7Rfyk2Fi2e3A=
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

WWVzLiBNRUMgZmlybXdhcmUgdmVyc2lvbiAjNDI1IHNob3VsZCBoYXZlIHRoZSBuZWNlc3Nhcnkg
Y2hhbmdlLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCk9uIDIwMTktMDYtMjAgMzoyMyBwLm0u
LCBaZW5nLCBPYWsgd3JvdGU6DQo+IEhpIEZlbGl4LA0KPg0KPiBEb2VzIHRoaXMgcmVxdWlyZSBh
IE1FQyBmaXJtd2FyZSBjaGFuZ2U/DQo+DQo+IFJlZ2FyZHMsDQo+IE9haw0KPg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS3VlaGxpbmcsIEZlbGl4DQo+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDIwLCAyMDE5IDM6MjIgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCAxLzJdIGRybS9hbWRrZmQ6IEFkZCBjaGFpbmVkX3J1bmxp
c3RfaWRsZV9kaXNhYmxlIGZsYWcgdG8gcG00X21lc19ydW5saXN0DQo+DQo+IE5ldyBmbGFnIHRv
IGRpc2FibGUgYW4gaWRsZSBydW5saXN0IG9wdGltaXphdGlvbiB0aGF0IGlzIGNhdXNpbmcgc29m
dCBoYW5ncyB3aXRoIHNvbWUgZGlmZnVsdC10by1yZXByb2R1Y2UgY3VzdG9tZXIgd29ya2xvYWRz
LiBUaGlzIHdpbGwgc2VydmUgYXMgYSB3b3JrYXJvdW5kIHVudGlsIHRoZSBwcm9ibGVtIGNhbiBi
ZSByZXByb2R1Y2VkIGFuZCB0aGUgcm9vdC1jYXVzZSBkZXRlcm1pbmVkLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmggfCAyICst
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNf
YWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQo+
IGluZGV4IDQ5YWI2NmI3MDNmYS4uZTNlMjE0MDRjZmEwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaA0KPiBAQCAtMTIwLDcgKzEy
MCw3IEBAIHN0cnVjdCBwbTRfbWVzX3J1bmxpc3Qgew0KPiAgIAkJCXVpbnQzMl90IGliX3NpemU6
MjA7DQo+ICAgCQkJdWludDMyX3QgY2hhaW46MTsNCj4gICAJCQl1aW50MzJfdCBvZmZsb2FkX3Bv
bGxpbmc6MTsNCj4gLQkJCXVpbnQzMl90IHJlc2VydmVkMjoxOw0KPiArCQkJdWludDMyX3QgY2hh
aW5lZF9ydW5saXN0X2lkbGVfZGlzYWJsZToxOw0KPiAgIAkJCXVpbnQzMl90IHZhbGlkOjE7DQo+
ICAgCQkJdWludDMyX3QgcHJvY2Vzc19jbnQ6NDsNCj4gICAJCQl1aW50MzJfdCByZXNlcnZlZDM6
NDsNCj4gLS0NCj4gMi4xNy4xDQo+DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
