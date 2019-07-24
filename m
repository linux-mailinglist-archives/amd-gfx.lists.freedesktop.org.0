Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B807672749
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE146E448;
	Wed, 24 Jul 2019 05:23:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730080.outbound.protection.outlook.com [40.107.73.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5B06E448
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIHKxZOwe+w03Rq9Wuy1DhUNJhyXRx0/sWDjubeW1tk1kWAulxU30+UfKESe3ZHivdaBwNQYjv4Omj25p6cZ5g4N+1g2lUDcPgELqjKlpLpgcdN0T2WJLlaaUEIroQUYSnP03LHvkrXuaCBVzvgdHU69sAG0hT00wfNiA+U1ZGoxr1xWwj3qWe3bSXZhWSsj9RJxa3mO/tfIhGl1OXqQTyqZaRQVxpwgfHcf+/IxQvvHqDjRuUYw9CQwNfD4qZTfLlxXMzAPmZ79Lvvb4rXp3u9t+2g3BKZcUw82WMVwCNAAAZh2/Uqdpdec98hbarATB7N+XXFazW07x791PFuPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aQIknwmYjn+cI/AHnlnTNDz3gtR/pBvfLULjs8syaw=;
 b=NEdJUi0fOuI+GcH9baR7MReQt8CY5HN7Fu46hzF0P36AGXRkJ26EXjE/ebWlka7kAfegPpYSwvuuKeXDv3Ir1pids2crUYq/qnJ8mJ7S+djGwdSa7DEuT2kWrUJqZNWwXAgzUh4l2P9rXEf6jassNQ42iuVJOVbLL4bB8OpIx/X86XSxBJi1njYy8io0+huxMyLimujgLdfGrrr0+0QGZND0pHK34Wutlkl6iUMy7G1EjmzS8K+YNddECz6PWVqLdILGB9YHTu6QyMnwlX9QMmmPeQi+ZNBXu3niAg8kxCD5Zn7QrOFfypBCedxmv+iEXNmkIYwL5TChDXstHU8r4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3104.namprd12.prod.outlook.com (20.178.243.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 24 Jul 2019 05:23:24 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 05:23:24 +0000
From: Kevin Wang <kevwa@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/9] drm/amdgpu: add reset_method asic callback for navi
Thread-Topic: [PATCH 6/9] drm/amdgpu: add reset_method asic callback for navi
Thread-Index: AQHVQdy53xk/klMmVEqIgB24u8gCPqbZPBKA
Date: Wed, 24 Jul 2019 05:23:24 +0000
Message-ID: <50936d7e-14ad-a686-139d-0ba6a4a44b94@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
 <20190724050012.31398-6-alexander.deucher@amd.com>
In-Reply-To: <20190724050012.31398-6-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0302CA0018.apcprd03.prod.outlook.com
 (2603:1096:202::28) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb623377-712a-474d-d044-08d70ff70cc5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3104; 
x-ms-traffictypediagnostic: MN2PR12MB3104:
x-microsoft-antispam-prvs: <MN2PR12MB31046F9C79715F46E5D464ECA2C60@MN2PR12MB3104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:457;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(199004)(189003)(31686004)(2501003)(5660300002)(25786009)(36756003)(68736007)(316002)(110136005)(478600001)(8936002)(81166006)(81156014)(76176011)(52116002)(14454004)(31696002)(66066001)(8676002)(99286004)(66946007)(66446008)(64756008)(66556008)(66476007)(102836004)(53936002)(26005)(2906002)(6436002)(386003)(6506007)(53546011)(7736002)(305945005)(186003)(6246003)(71200400001)(71190400001)(6486002)(229853002)(256004)(14444005)(6512007)(486006)(2616005)(11346002)(476003)(4326008)(6116002)(3846002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9aSZBPvi2v+9CButLEJjNQxed3xlAc6+6S5wyQKG+W/u/hfDl65STUjqgaLgECSWoXdlG78LzTtXh7wRe4BhTA5sBNq7QqTWpKCxU0Z6Wf6UEKmf5XqJtlaxUGXLnICfVSylL5fru1Z4suJrECQsI5n8WqPbQ2DCEOyj1UNiRHNwObamBEW5BVO21ULX0NU08SZ5X6xgwQai6Hl24ZloFJ6Es/sOZjORJbmYViOVMGEwqr3O55HFPCnpjxdLkysUKYoZK6WUdet4JQRXw8XdhUYU1jczPvZ9wlreJwmWqqp3EiI3U66Ue6eKS+YN8ld7pNWtbAlPr5vQ6KcVwJSeWidvHecN3w30+/K3dszcnzG6W+/Cm+tPR1Zr7R1cjeyVwDodf9xzv3ZtLQ/kkVFiLXIFgBgjG3HB3aTxjbU7pxc=
Content-ID: <6841F4BD38A8A547A0A3FCA2DF302073@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb623377-712a-474d-d044-08d70ff70cc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 05:23:24.4792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aQIknwmYjn+cI/AHnlnTNDz3gtR/pBvfLULjs8syaw=;
 b=1Qe7tfKzPuFxdwZ7oCqKoQBmj7fPXPCyzG3Xz+a5fsMLfqqgGCUrCy/459C/Ib2DmA0ZnS9teG+yoVgQsGnNe3sRvJkcgXe+Y62zJ2ukyALZDEfk6RIE2wQyREdU2SV8Jl5vpVhWa5aTtY3ViOXOxba5mRRESQ/xhMslHxRHLO4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCk9uIDcvMjQv
MTkgMTowMCBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBOYXZpIHVzZXMgZWl0aGVyIG1vZGUx
IG9yIGJhY28gZGVwZW5kaW5nIG9uIHZhcmlvdXMNCj4gY29uZGl0aW9ucy4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMTUgKysrKysrKysrKysrKyst
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQo+IGluZGV4IDZjNTliNjRiOWJiMS4uYmY0Y2JjZGVl
Zjc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMNCj4gQEAgLTI4OSw2ICsyODksMTgg
QEAgc3RhdGljIGludCBudl9hc2ljX21vZGUxX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPiAgIA0KPiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gKw0KPiArc3RhdGljIGVudW0g
YW1kX3Jlc2V0X21ldGhvZA0KPiArbnZfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQo+ICt7DQo+ICsJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+
c211Ow0KPiArDQo+ICsJaWYgKHNtdV9iYWNvX2lzX3N1cHBvcnQoc211KSkNCj4gKwkJcmV0dXJu
IEFNRF9SRVNFVF9NRVRIT0RfQkFDTzsNCj4gKwllbHNlDQo+ICsJCXJldHVybiBBTURfUkVTRVRf
TUVUSE9EX01PREUxOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGludCBudl9hc2ljX3Jlc2V0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIHsNCj4gICANCj4gQEAgLTMwMyw3ICszMTUs
NyBAQCBzdGF0aWMgaW50IG52X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQo+ICAgCWludCByZXQgPSAwOw0KPiAgIAlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2
LT5zbXU7DQo+ICAgDQo+IC0JaWYgKHNtdV9iYWNvX2lzX3N1cHBvcnQoc211KSkNCj4gKwlpZiAo
bnZfYXNpY19yZXNldF9tZXRob2QoYWRldikgPT0gQU1EX1JFU0VUX01FVEhPRF9CQUNPKQ0KPiAg
IAkJcmV0ID0gc211X2JhY29fcmVzZXQoc211KTsNCj4gICAJZWxzZQ0KPiAgIAkJcmV0ID0gbnZf
YXNpY19tb2RlMV9yZXNldChhZGV2KTsNCj4gQEAgLTUwMCw2ICs1MTIsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGFtZGdwdV9hc2ljX2Z1bmNzIG52X2FzaWNfZnVuY3MgPQ0KPiAgIAkucmVhZF9i
aW9zX2Zyb21fcm9tID0gJm52X3JlYWRfYmlvc19mcm9tX3JvbSwNCj4gICAJLnJlYWRfcmVnaXN0
ZXIgPSAmbnZfcmVhZF9yZWdpc3RlciwNCj4gICAJLnJlc2V0ID0gJm52X2FzaWNfcmVzZXQsDQo+
ICsJLnJlc2V0X21ldGhvZCA9ICZudl9hc2ljX3Jlc2V0X21ldGhvZCwNCj4gICAJLnNldF92Z2Ff
c3RhdGUgPSAmbnZfdmdhX3NldF9zdGF0ZSwNCj4gICAJLmdldF94Y2xrID0gJm52X2dldF94Y2xr
LA0KPiAgIAkuc2V0X3V2ZF9jbG9ja3MgPSAmbnZfc2V0X3V2ZF9jbG9ja3MsDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
