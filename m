Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5581BBBDAD
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 23:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57DB893EC;
	Mon, 23 Sep 2019 21:14:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D08893EC
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 21:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XL50Xkp3sd70LbNjI0jqqPINe4WMaB6t/uc4pLEJoLilf22ppF4G1vGHym1fmhAwImrdcqfIPeoZv9P01SQ4B+aOx3/oUYTtmhbenKuUw06j9c7suuoTzfB9TcztrLD3VMTJ2mWCsmemILosDOLqy2EdThOTdgbCj+wCSssZcW5YPTuOLkL4Qdnjv/ZhLIuEowJ3nHLUoH9kIrTawmGdi+dSgSp8JyE9v3FABBaComuCHVYMPsAczLuPq+UDG9XMD6ovNvek4R1no8cHw5Ftme41c4PNQ1q1hQ4ArDFKD6pqEpEQx4lgTmQZ/waeUcmneNeT3W4MECCRiFtZ/s5IfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx8fILTX4tL7wwU1yLvNiIDO4JkIKRNYKsv335q2dD8=;
 b=EMYJgNG4xG2IwD+g6GXNALjv3bP0SKsJU8t8fAZFUvHmHhFAcnt2Z0011ptoolR03D4aJsxmkKpBRvkEGBiYFAe4e9DKl97TMQ6WE6u7GxtF+DrlABZ5X0oJEaKykrU1FxBgmrzr2RfuL9xQZFYpcLwwKFEE2lMQAeS4ZnelKH+MsGBHT33zKAhdA2qp2msI8K7z8IHz6K9geLcmPQZGTLS3BvXAPxnedAaVEO7W2o6wEwyyyMTkTIzvvFVDAgb/PVxwWm0ZS1fwU8VSToo88CnaywvSgZMtu52hxquo8jePlC1WMtbM5MmVUtAaHNSKlw7Qe68Tq8iN+KLSbtjySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2470.namprd12.prod.outlook.com (10.172.116.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 21:14:52 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2284.023; Mon, 23 Sep
 2019 21:14:52 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: include slab.h in dcn21_resource.c
Thread-Topic: [PATCH] drm/amdgpu/display: include slab.h in dcn21_resource.c
Thread-Index: AQHVclGhPH1nX8YEI0SYS3gJtNz1bac5wzqA
Date: Mon, 23 Sep 2019 21:14:51 +0000
Message-ID: <9ad314e5-1a6f-f17f-ac1c-ec33aed2912e@amd.com>
References: <20190923205804.12300-1-alexander.deucher@amd.com>
In-Reply-To: <20190923205804.12300-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
x-clientproxiedby: YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::19) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b760fa8-b1f4-4686-ef88-08d7406b12bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2470; 
x-ms-traffictypediagnostic: CY4PR1201MB2470:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB24706E218F50B6C833FF75B08C850@CY4PR1201MB2470.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(199004)(189003)(66556008)(66446008)(66476007)(71200400001)(386003)(11346002)(4326008)(64756008)(476003)(2906002)(2616005)(8676002)(8936002)(81166006)(31696002)(6506007)(6512007)(486006)(71190400001)(81156014)(65956001)(65806001)(53546011)(3846002)(66066001)(31686004)(6436002)(229853002)(305945005)(36756003)(6486002)(7736002)(6116002)(58126008)(478600001)(25786009)(2501003)(186003)(26005)(66946007)(316002)(14454004)(6246003)(256004)(110136005)(102836004)(4744005)(52116002)(5660300002)(446003)(99286004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2470;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SSXAH0wFB7rQ5kkVRbUHiB8sEepuDq8cLEv2YKb18VBRkDuUX4b3h4nyS/ZigRGvRj+IIjL3SJqiY9W6uskz5ZjM2kDjMOWi1evFhJvhaWdCSOs8yHjIq6twEVGKDRunGR1rikF/hdjUvvbvmYKfmZVBhRuo8Y0K+p86r4+ZVyoFhlOV6yPhFObTGQjjhjGgb2nQjCnN03F8c5oVPRkK0NiqfEn0YzrWrH9H+p75D6hYkjokVDBXEsSgFiOdiuG+oVKFZo/cKHQSivze536K2T26mLdTy6Qsrtk4CAxvUlPhX+T18kBtC/F8AcZJ+tMt9ZFspp03eWi0dQ4nCQ7DuNx1iT/RBs8G99U4TpQPYqbUf8F803XIIZSB1KvNPj4tLpUFEgTWdd7UxMCM7s9vEvTWm/9bOkbkrwqhKMiOlQ8=
Content-ID: <2370170EA4D6F7479592148C8BE85EFF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b760fa8-b1f4-4686-ef88-08d7406b12bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 21:14:51.8989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2prSIJaNb8FiZhuAHw5VPjnTgd4xeds6SQ19ueAMO3EZ7wp2uR11eSveVJk81M8xrmFihTDVwz+MJruYdqjlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2470
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx8fILTX4tL7wwU1yLvNiIDO4JkIKRNYKsv335q2dD8=;
 b=IEsowMnUqux81lf6DE2SiBr2wp4CYqZGzqsrASjmVW17Z0gBqiSYkndFWTT3v7jzJDNiMJ1S5Wl7asodEAQeil86Sr34INKxIUbrO1XGvyhGIjsycp7F1SK7Q4Ltn+uk1YR/UwoC1LLmpjWfQ6xGxWYz1P1XwIs3j0bemfEstcU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

T24gMjAxOS0wOS0yMyA0OjU4IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gSXQncyBhcHBh
cmVudGx5IG5lZWRlZCBpbiBzb21lIGNvbmZpZ3VyYXRpb25zLg0KDQpDdXJpb3VzIHdoaWNoIGNv
bmZpZyBmYWlscyBhbmQgd2hhdCBjb21waWxlciBlcnJvcnMgd2UgZ2V0Li4uIFNvdW5kcw0KbGlr
ZSBvdXIgaW5jbHVkZXMgYXJlIG1lc3NlZCB1cCBzb21ld2hlcmUuDQoNCkhhcnJ5DQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVz
b3VyY2UuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
cmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9y
ZXNvdXJjZS5jDQo+IGluZGV4IDNjYTUxMzlmMTI3My4uZGUxODIxODVmZTFmIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2Uu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVz
b3VyY2UuYw0KPiBAQCAtMjMsNiArMjMsOCBAQA0KPiAgICoNCj4gICAqLw0KPiAgDQo+ICsjaW5j
bHVkZSA8bGludXgvc2xhYi5oPg0KPiArDQo+ICAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCINCj4g
ICNpbmNsdWRlICJkYy5oIg0KPiAgDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
