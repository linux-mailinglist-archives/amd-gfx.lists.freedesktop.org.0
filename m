Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039636BC84
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 14:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895FB89B05;
	Wed, 17 Jul 2019 12:44:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730081.outbound.protection.outlook.com [40.107.73.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A08289B05
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 12:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gE1wgYN5sXMDEbdVkl/+h8wSEuCXp4WFrIyif2iNrdlri6+I26sAGW3tXcdXsUFNZRrh0ub9uNaq0dTdun6Nsl6ROzLgc/GdHeiTPajpsQdv5A5oyeQEI/fQSK75/cIoQSEfPq+RkIc31De8LwrV+TegeQteuVq9bPyjTk6Qegf5Z3HYZrhiWz1cDtztLJpa/7A8RiuEemp2K5wAhO/sy3U+oM1WejsPnMxGItZZG8tryfAIRASBRGrDcp5E2WWPuT1qAKMUN3a1g1FvVNgt0weGuR+M2OA8tlSW8A7crUur8MUC+j05CS2HVQArV1I97lfyhKcTvsDE1CR8vlA/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBNMS6SNXlNkDrSIhcEiELO8c+oycRro3KD6GAmSkpI=;
 b=YUXpGHeJQSWljpSPEwe7GD2P7JIR/z658b2iXGmfE78U5/93PRprS0C6P2orKgvUIs/Zj9zU9Ethgs5JY2Ehcj/sxUV60GWF/ehpstub9vB+mIYhSBYMr1CKNS32JGHuy6Fmm3GGO+AE3AnsnqyaQqPTkFIxVOcSdUgXFDbH19VxlPtxYNT1Yn8lSArv/z6YtF5sAmw1ftVIRkl/PTv6/aCMuAxQHuRNW/iZQyI/W8QYAmaFK9kHhF/f/2u/vto95hUj5I/dvMMC7JBks56PEAJwJ3i2EjYZsTilBQ3YwnstMX0hvnM7zAe2CUu63DSPehEDsUmOEgJuqtV/AjEI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1197.namprd12.prod.outlook.com (10.169.204.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 12:44:07 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 12:44:07 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debugfs
 interface
Thread-Topic: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debugfs
 interface
Thread-Index: AQHVO8kRvSSqzqpVH0SqsBcjPPwln6bNHEsAgAGmxAA=
Date: Wed, 17 Jul 2019 12:44:07 +0000
Message-ID: <4d8fb065-f31b-d730-04d0-6c6e83b3a171@amd.com>
References: <20190716112434.29017-1-tom.stdenis@amd.com>
 <e6bc6d43-d4ac-467f-22b3-2be79619b93e@gmail.com>
In-Reply-To: <e6bc6d43-d4ac-467f-22b3-2be79619b93e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:408:70::39) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7ff4598-b583-4345-11f7-08d70ab474ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1197; 
x-ms-traffictypediagnostic: MWHPR12MB1197:
x-microsoft-antispam-prvs: <MWHPR12MB119779DDA315272B3328D7BEF7C90@MWHPR12MB1197.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(199004)(189003)(256004)(229853002)(14444005)(81166006)(81156014)(36756003)(5660300002)(66946007)(8676002)(66446008)(64756008)(14454004)(86362001)(99286004)(6486002)(31696002)(66556008)(66476007)(31686004)(68736007)(8936002)(52116002)(6436002)(6512007)(486006)(305945005)(186003)(446003)(71200400001)(71190400001)(76176011)(66066001)(316002)(6116002)(3846002)(476003)(6506007)(386003)(53546011)(478600001)(102836004)(2616005)(110136005)(53936002)(26005)(6246003)(2906002)(7736002)(66574012)(25786009)(2501003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1197;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K2fK9y+hsezv5iJfods0oRLrUzDNmnPK5Ym7dlDiwBdnWXuCkBz8T5VX1VclUR8M69ZDTSQ0+oa5F7mG360LgLB8SAc4fD70JDBB2UqCZX53v0cZFH5X+gbAqX3bhM5u9A2W8DK//lHFZPEX3bKrAGmLhgK6iCmmU9RahIfsd32bV3ZEkaiPuFfaa0K+cQ3BSgpryAdo+oyUx3XqNz/TbF6ouCNc4vaHWRub8ljR6CL/E6E2Cd91kDY1hbnxSGAMHTKHQYyNrgJjmG8Lqw8KoQiHaIpEAqUktYWsUSlpXbpqS41TYRxqYP9hUFC8Tj2GsFwWvC9lKyLlLwER1CJo9G8tf697QT13EgoO+hDfMnlpUuETIqCIZ0q1y5y0w0EJ0QcDHNA6sFhxQtPQZQZ8vtP8aZ/K05mOho3jLxgWt+Y=
Content-ID: <5C73CA43C41CA34BAF40AF488CE5C4FF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ff4598-b583-4345-11f7-08d70ab474ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 12:44:07.1815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBNMS6SNXlNkDrSIhcEiELO8c+oycRro3KD6GAmSkpI=;
 b=Lw2J7lB8RZ28nPUQm8gvb6eFPciLUZQhLMRVeqp16aUu9J03+mjwjQgX+Jh8irQn5CIxK8nvBwUMC67BLvYCE0mNMcPk0edsEF8pbnOpxFVuxbjkIJVecDLEr/seW8YQ5F3MPIwLnkfOZ+P28Hp+IxET6MAq71ZU1A4gGF6Y3NU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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

VGhhbmtzLg0KDQoNCkFsZXggY2FuIEkgZ3JhYiBhbiBSLWIgcGxlYXNlPw0KDQoNCkNoZWVycywN
Cg0KVG9tDQoNCk9uIDIwMTktMDctMTYgNzozMCBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAxNi4wNy4xOSB1bSAxMzoyNCBzY2hyaWViIFN0RGVuaXMsIFRvbToNCj4+IFRoZSBy
ZWdpc3RlciBkZWJ1Z2ZzIGludGVyZmFjZSB3YXMgdXNpbmcgdGhlIHdyb25nIGJpdG1hc2sgZm9y
IHZtaWQNCj4+IHNlbGVjdGlvbiBmb3IgR0ZYX0NOVEwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KPg0KPiBBY2tlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPg0KPj4gLS0tDQo+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIHwgMiArLQ0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMNCj4+IGluZGV4
IDg3YjMyODczMDQ2Zi4uNTk4NDllZDk3OTdkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYw0KPj4gQEAgLTEzMiw3ICsxMzIsNyBAQCBzdGF0
aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX3Byb2Nlc3NfcmVnX29wKGJvb2wgDQo+PiByZWFkLCBzdHJ1
Y3QgZmlsZSAqZiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBtZSA9ICgqcG9zICYgR0VOTUFTS19V
TEwoMzMsIDI0KSkgPj4gMjQ7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGlwZSA9ICgqcG9zICYg
R0VOTUFTS19VTEwoNDMsIDM0KSkgPj4gMzQ7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcXVldWUg
PSAoKnBvcyAmIEdFTk1BU0tfVUxMKDUzLCA0NCkpID4+IDQ0Ow0KPj4gLcKgwqDCoMKgwqDCoMKg
IHZtaWQgPSAoKnBvcyAmIEdFTk1BU0tfVUxMKDQ4LCA0NSkpID4+IDU0Ow0KPj4gK8KgwqDCoMKg
wqDCoMKgIHZtaWQgPSAoKnBvcyAmIEdFTk1BU0tfVUxMKDU4LCA1NCkpID4+IDU0Ow0KPj4gwqAg
wqDCoMKgwqDCoMKgwqDCoMKgIHVzZV9yaW5nID0gMTsNCj4+IMKgwqDCoMKgwqAgfSBlbHNlIHsN
Cj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
