Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8298DD97
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 20:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D1389C93;
	Wed, 14 Aug 2019 18:58:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D0C89C93
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 18:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfGYEvmeUYpoe2ZzPkOx+evDj5RSERtc5CVvQcy4EOCcsMQg35JhvqdRihCMls1HSDt0iWieA+6QoVQ5zPrha348SLa183+GseG1uNeJwVKIzqtAlEFRCelJ1+GlkyoTUNIdTOpjZkyDIlAc1MjBfcEnT+VYFCyDU3cgpy1t62ZGRaYUWSPBdN9EU8tt2kqJn+0KXGND11d2DoV/l70O/0inJOqELtcO0okiHvHQMJbpAehs9Ly77HIecpAzeukN8tiQwCCNRQVRUSjFxrrBgMImQxgbgr5GaaGdCJWaw99o0fpZS0lt5yiMDVAEkCyEOgrHcFERTAmz0FoYtkl7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COO8fEIWb8m+6+jvr/6yFIaZ1yQRqKyX5oLd1gyU6UQ=;
 b=aZJB6BRhmQeZu6eZNE6PsGQVwc/d2hSKD4f4hgVn3bhGC+/agvxgznK7g5FMc6Ca1uRhuG7Xf7tArmKc1tIh5Z8Icq0Fdab1Q0QgZsbNQrJQ7r9gYx6DkzCXfZ2yzMlVA1bsX01KxvHveHqQFTJNmkAG6uMVSM5wfEfr2SY89J6tEF7rHV9KzdHlpOWrHFlrkKa+ww2nXTQqNVcxaDtSCeEBaXgHPKw3CEoEkWpwfhwHe0zOv1FTWmVarQTUEWw7T0Pj+RAW4HrB5L/WZNZvWvFW8mmBoEYQu8dppZI+X1ozwKCEODJ4AJgNkrBz6dK8mPSbMZYHkzMIx40w7JMwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3049.namprd12.prod.outlook.com (20.178.30.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Wed, 14 Aug 2019 18:58:40 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 18:58:39 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: Add printing for RW extracted from
 VM_L2_PROTECTION_FAULT_STATUS
Thread-Topic: [PATCH 1/2] drm/amdgpu: Add printing for RW extracted from
 VM_L2_PROTECTION_FAULT_STATUS
Thread-Index: AQHVUgILV3L5j6Tr2UmTJcqsC2DSj6b6P44AgADA/QA=
Date: Wed, 14 Aug 2019 18:58:39 +0000
Message-ID: <7d0a21f2-c361-927b-cb4d-f5e66fc94a0e@amd.com>
References: <20190813180744.10901-1-Yong.Zhao@amd.com>
 <f4eee045-e4f3-c21b-a231-3417a1243800@gmail.com>
In-Reply-To: <f4eee045-e4f3-c21b-a231-3417a1243800@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b098819-ad0b-448a-9150-08d720e96b2e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3049; 
x-ms-traffictypediagnostic: DM6PR12MB3049:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3049037CE40EC6A326C2FB4CF0AD0@DM6PR12MB3049.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(189003)(199004)(36756003)(53936002)(2616005)(6246003)(11346002)(478600001)(446003)(6116002)(316002)(476003)(6486002)(4744005)(229853002)(2906002)(110136005)(14454004)(256004)(66066001)(486006)(25786009)(5660300002)(6512007)(81156014)(7736002)(81166006)(31686004)(86362001)(305945005)(66946007)(26005)(71200400001)(71190400001)(6436002)(386003)(6506007)(102836004)(31696002)(66446008)(64756008)(66556008)(53546011)(66476007)(8676002)(186003)(99286004)(76176011)(3846002)(8936002)(52116002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3049;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vC9+Lemo7n4INX+M9x7ll2OesETXWHW38NtM+e+mZkUD/pplvPrYJujHgxwoVHgeqedlHFdFCqP73JvyNaX3Sd6FMIRu9UEfdh7RfiNoSKaKxPrn5I1DQeLcor+eTTgte2X0I20FYH5i4Kb7SgGHBZu37XWvOX/OFUxNDLLqn6OPEGu7NQMfrdODXdDLMOdfrOPaTime0CQmloKwQQCRkq3pNPDwDKkz/QEpUT54EsqhO5w5GPd2MYiKqdZ5V4p9x1C1JGFFZ8I3R3hVH4VdtZCIVfvNTE+JXkPZad1Ha4elFV0UEcdBq073daJzxIzDGY7gWrHYJEhkupf7kDe+WdRIGNJXy36SrJNpw/inMOR/uzSNX7PMIA0KVuaaaE3IhXhefr1NyqBD4WZho89x6Xx8/yo7C+yYjfakDQh0fio=
Content-ID: <927B7199540D2F459F42497582F8687E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b098819-ad0b-448a-9150-08d720e96b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 18:58:39.8294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtYnfaF96TyRXx8lB0gWKK6gsmmZZU9PUDbWdoZ2zw7LYLkqWp5oSbLjLTDzt3Mv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COO8fEIWb8m+6+jvr/6yFIaZ1yQRqKyX5oLd1gyU6UQ=;
 b=TegQQoSpc4Cz68GEcymPxwWks7AQZLsbKloCBelIif2cMJgmppRsFnb0Lj5yzgOqo2AMpxf/w4Dt9ZFIs7UNEzXaXsox6On5I2zbT2+Y8ZU8Yp2+Kftqd+ivygo0FlMLa5WXahb712zfFGruiqrOU5SG+giLwdlFQ+RGpy4jpBQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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

UHVzaGVkISBUaGFua3MuDQoNCllvbmcNCg0KT24gMjAxOS0wOC0xNCAzOjI3IGEubS4sIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEFtIDEzLjA4LjE5IHVtIDIwOjA4IHNjaHJpZWIgWmhhbywg
WW9uZzoNCj4+IFJXIGlzIGFsc28gdXNlZnVsIGluIG1vc3QgY2FzZXMuDQo+Pg0KPj4gQ2hhbmdl
LUlkOiBJY2Y0YmQ2NWVhMTY4ZTU5NjVhNmE4ZWJlMzJjZTkzMjdhMmRlMjg1MQ0KPj4gU2lnbmVk
LW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCj4NCj4gUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIHRoZSBzZXJp
ZXMuDQo+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgfCAzICsrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIA0KPj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+PiBpbmRleCAyOTZlMmQ5
ODI1NzguLmVjNWU4NTg5MjZhZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMNCj4+IEBAIC0zODcsNiArMzg3LDkgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9j
ZXNzX2ludGVycnVwdChzdHJ1Y3QgDQo+PiBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihhZGV2LT5kZXYsICJcdCBNQVBQSU5HX0VSUk9S
OiAweCVseFxuIiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUkVHX0dF
VF9GSUVMRChzdGF0dXMsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZN
X0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBNQVBQSU5HX0VSUk9SKSk7DQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGFkZXYtPmRldiwgIlx0IFJXOiAweCVseFxuIiwNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUkVHX0dFVF9GSUVMRChzdGF0dXMsDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZNX0wyX1BST1RFQ1RJT05fRkFVTFRf
U1RBVFVTLCBSVykpOw0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqAg
fQ0KPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
