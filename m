Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4B815C5
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 11:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D676E3C9;
	Mon,  5 Aug 2019 09:45:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780041.outbound.protection.outlook.com [40.107.78.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25106E17C
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 09:45:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms5kiZ1Moy9PPSCW7wC8obtxuj8L9hlRksqnLf0SOR70M/dGl16zoSklhrEIo4U3/kIiILfExMNj5r3lznBfyGFuoKx32OGKqbKkVkHpMush/bxXnFrLZXRacVFjueQkzaUT36eSXRU4+vBauqj//6m94DJ2gVcAD6riqBoLHbpa4dIQCgHOoZEmlZ3MVQDjGFW+SOq9gl7AzgIvVdpWlvLBXwyA+DKt6x59MIbEaFZhJ7VPaHvgQzD4JqRAr8D33N+aYeIb5PRGwUvLffxSL+1e0wsrVLquTfx5Yv4Hkqh13vmlJqn7pTYXMtoIfQS/4GcICNGPDLMas6JJjoSLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZLNdAKRirztdqxkNeQm1XLmFR+oAfdlvQGjNt+a9sk=;
 b=fOHIvDbdm9EONFW1C2Ln6sPiPb8pAr0QJsGBongnfj5SYB08meMwzFTvxYh5mGCQZuHKRpkOVALXQWacVOdZyHj35ECCvmVH0W0HcqaLWsAOl+vFeh8QmMomXqWzifGI0PHWNW1gQ5hZoC8GYUb+1OHW6oqTDyYiCaLpi8RbCKsDogXKMPkJ+I+oiivwWNY68S1taRRpyCMFu7lfAJNUAjYOZ9gdIS8EHX877ZwTtpd3jf5wKp8lKB9btalZ8j9OPffw75kNYH9GFXDh/rNCrSdnF/xs0oXUhG2QViHS+bINa2p+whDrHvNf+JoyHOI9u2z9plUCxk3A7qQNWWV4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1516.namprd12.prod.outlook.com (10.172.34.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:45:00 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:45:00 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Topic: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Index: AQHVS3EkA4EKvnoptUeAcXLScEFrSKbsTdYA
Date: Mon, 5 Aug 2019 09:45:00 +0000
Message-ID: <DM5PR12MB1418EE05F666713D1B599859FCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1564997723-3737-1-git-send-email-tianci.yin@amd.com>
In-Reply-To: <1564997723-3737-1-git-send-email-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c91bfd9-9243-47e1-3c5f-08d7198995aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1516; 
x-ms-traffictypediagnostic: DM5PR12MB1516:
x-microsoft-antispam-prvs: <DM5PR12MB15162D6F5D7935322F0250DEFCDA0@DM5PR12MB1516.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(13464003)(81156014)(446003)(26005)(6506007)(316002)(6116002)(3846002)(54906003)(76176011)(66556008)(64756008)(476003)(66446008)(186003)(53546011)(229853002)(102836004)(5660300002)(486006)(53936002)(110136005)(6436002)(2501003)(4326008)(305945005)(76116006)(2906002)(66476007)(11346002)(478600001)(7696005)(66946007)(52536014)(71190400001)(68736007)(9686003)(6246003)(14454004)(256004)(71200400001)(25786009)(99286004)(55016002)(66066001)(7736002)(33656002)(8676002)(8936002)(14444005)(86362001)(74316002)(4744005)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1516;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s9qMhzFkfW9BuFdq5P7GfZgvhfrJK9T9xs/X7RuXp77t81wWoeUTIvCTGlfouTFazMbleFfq0FgxkwZD/OAYVXPvdrSQ43zkz3697svBr4c2AmqPwa4dCaHDtv3ifGMvDt5GrN8APUSBOYx9v3EP7WgZMm1vnbOpOPhyKee4dWy2wxkvNMkHih6GI/ri18IPOIPdoEMEywkL0xMwBE9hVHRlMGy322HhZ06B/NV/X73nrlf+fAaNk1do1xJtf9o0bHtqPJ6dFJ6EGx1EMVOBHYbPwjV1+qA2stM3hQ86puHfbqLeGkBMgH7Zyb53nOQb09pFKZ4m9aBfov0l9u0+zGNh8pqaJeNrk6c51qqJzCGWP8paL+4aXZlEDboeuULq6H6EhsyUmZmqWHcfsGxohI3Sk6N6RkGOJuaS3Dd5jI0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c91bfd9-9243-47e1-3c5f-08d7198995aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:45:00.6201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZLNdAKRirztdqxkNeQm1XLmFR+oAfdlvQGjNt+a9sk=;
 b=2A6gxL7NGls/jIFbpb9ZgH8nUHd5lawxMJ/1oLBJepLmixYz1jz5pghpGzGpc2745FTg8Q8ErZkaI2JmIO9Rij3Y/PYwzdfhsQtTOAl20IkV1JDCdyHtzyJzXjpi2CONp5zxviq0WYykA6yoxR1MPuhKVILS4Od6Tr+8L1sOpE0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUaWFuY2kg
WWluIDx0aWFuY2kueWluQGFtZC5jb20+IA0KU2VudDogMjAxOeW5tDjmnIg15pelIDE3OjM1DQpU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBZdWFu
LCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT47IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlh
bmNpLllpbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L3NvYzE1OiBmaXgg
ZXh0ZXJuYWxfcmV2X2lkIGZvciBuYXZpMTQNCg0KRnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5A
YW1kLmNvbT4NCg0KZml4IHRoZSBoYXJkIGNvZGUgZXh0ZXJuYWxfcmV2X2lkLg0KDQpDaGFuZ2Ut
SWQ6IEk3YjQ2ZjdiNDliNmQwNTg2ZDFmYTI4MmQ0OTYxODE1ZmIxMjQzNzliDQpTaWduZWQtb2Zm
LWJ5OiB0aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGluZGV4IDliY2U2YTEuLjJm
NDViZjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQpAQCAtNTQ2LDcgKzU0Niw3IEBAIHN0
YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQ0KIAkJCUFNRF9DR19T
VVBQT1JUX0JJRl9MUzsNCiAJCWFkZXYtPnBnX2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfVkNOIHwN
CiAJCQlBTURfUEdfU1VQUE9SVF9WQ05fRFBHOw0KLQkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0g
MjA7DQorCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAyMDsNCiAJCWJy
ZWFrOw0KIAlkZWZhdWx0Og0KIAkJLyogRklYTUU6IG5vdCBzdXBwb3J0ZWQgeWV0ICovDQotLQ0K
Mi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
