Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339E482BF3
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C765889E11;
	Tue,  6 Aug 2019 06:46:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF49189E11
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf+l2NnZ8OBANLrC48GjNwmgiXPt84ECr6Esg7IhuMPX3oTEN9R15kf3PQfPFNszJM9/QiCz//MlAKY26F/hyw7rAUWfzQTQOCCnVfZ8h0FJgMtJR8JaILHDthbdBpuJciZGm9yFmB5Vmeg99yEMrQIxJYEoQZXRIROyPbyReSI+2aXADQYtUEFJ1crOHGjGArt5itz8qHzCBSOkiNyeF0ioN4qvnv7d7o7jNHduARUUSQ37q3MMtm4E73zSa6y1En2Imv7wvh9icGKBZzjSzv5JWqIQPQtZAG46dog+PCNO5Kd6j69AeWVwMmzbIbIyHVsB3uhvDl8B5/MA3XyHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVHfz/SrVfg/hLlPoC5uQ9gJqtnRHYZYz/LgrNL6tGc=;
 b=YaFKM3Ql+NbsDTYowrapGnD8DnICX+ZhjtyXsOujzZwo48R2XUfNaGTX1LPF2A+4e7/qhPOdxb92l1lP7jbPP6JLaQrJ3KYfyXp/nGiKi6SvTMEY+gIAEBn73iG8tahu6Ics5aijQ0HKXXGmGjcyfxy+Qj+9ewF1Ktd2Q4rlROEfS32BHVVhWDwKmlvBIZqRsPgjDDPZpMVABzUpTnTjX02GMIWu3lUA3+OK6UFXvprJVFpj9f+TrfEKZR7WBU0jc0duZ2mUWbBji+/Cs5N8kfENRsS/sRL1eUAIJLfpe6SDuYnphk5J0ovpmYs3R5auMryyNVpL2aPoRf99SdPBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:37 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:37 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/10] drm/amdgpu: enable ih clock gating for navi12
Thread-Topic: [PATCH 07/10] drm/amdgpu: enable ih clock gating for navi12
Thread-Index: AQHVTCKxegj5ElnnOECbTQ4twDf89A==
Date: Tue, 6 Aug 2019 06:46:37 +0000
Message-ID: <20190806064546.19434-8-xiaojie.yuan@amd.com>
References: <20190806064546.19434-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190806064546.19434-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::13) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c55676b0-aaa9-4530-da10-08d71a39d408
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540B8976EFFEB9A1850A06E89D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(54906003)(446003)(26005)(76176011)(11346002)(2616005)(68736007)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(4744005)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JySuLibKKzmxL9ZUIpHpMN52tKNs7lghp12rgLeM3Dxq6QDUeUItuIwzE0eYXgv1ufjR7//LmmwIGPyFknfUQM3jWawAQchMXHaKR6PXplO8o6iYdVfFNyaqJb3sf8Gf7LYz9WJczoBhxkV/kaEGygjT91dKTOwL8WA1RqpR+FKfYCzGEqARhZIctm/3XTvDso5UGVsyOv+5Y7PWQaGaflhjvsBGGsOF+vHBG6eYlP9YbqoW+YEIp1mYsV095YrZXzMZAW1KgcS86XPPWYpKFqdpGTJbUC5err7sAaCwshLBYhRXMXfz6rSLfvmqiPci8DhCkphPmEKsaPU2kZ9/RKefxUXEqQzQq0cZHfz3awqbnmJEyulnDwUlOST9rF/6JxRqqX6TGeNL6EJFOX3lrlcbRf919WQpa0al+JqyEr4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55676b0-aaa9-4530-da10-08d71a39d408
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:37.2900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVHfz/SrVfg/hLlPoC5uQ9gJqtnRHYZYz/LgrNL6tGc=;
 b=1cStaZsgqC5bqiCSjMnjnC8rudzZIEtMPpDbb1KDUo5gi4r86Yu3Q9emUc7uptV3n3eho94ENcN1LRh4bpuXzdB+Bip6Rc7rWshoeCQmzUHWoB3ENtMs8ONgIThptvSonkfpAQlMllAoGFKRck0DHGmEL2eToMfWQ88tdLRMvs0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZW5hYmxlcyBpaCBjbG9jayBnYXRpbmcKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlh
b2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMK
aW5kZXggOWI5N2IyNTQzNDU0Li5iYzUyOWYwYTZiNWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYu
YwpAQCAtNTY2LDYgKzU2Niw3IEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9p
ZCAqaGFuZGxlKQogCQkJQU1EX0NHX1NVUFBPUlRfR0ZYX0NHQ0cgfAogCQkJQU1EX0NHX1NVUFBP
UlRfR0ZYX0NQX0xTIHwKIAkJCUFNRF9DR19TVVBQT1JUX0dGWF9STENfTFMgfAorCQkJQU1EX0NH
X1NVUFBPUlRfSUhfQ0cgfAogCQkJQU1EX0NHX1NVUFBPUlRfSERQX01HQ0cgfAogCQkJQU1EX0NH
X1NVUFBPUlRfSERQX0xTIHwKIAkJCUFNRF9DR19TVVBQT1JUX1NETUFfTUdDRyB8Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
