Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0008E71A28
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 16:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7447B6E2CF;
	Tue, 23 Jul 2019 14:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598646E2CF
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 14:22:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MumvYHfa3O+5WvfbGgbgjNJ06OopF2X0FC76xOJAC4gJzEwJ0stukryJ+/EGpIyeKKrj1Z+wwtjGKZVX86SRkfsxY8gFYLYr5jXOe7sQ9c/pUsb1p2DBvSuK3KPo9VLHxcnPO05X9Y3kcD7pfLkwEt3i3BhL9r7odlEtWMjuLmyIfhQiFAOYc3rZqvW6JDyD7gPL29DPUuJluQTKIVmKejyCNIMz0XYXcCf+krq784cIplCZMml2hOWfiIwyHc5nLjfJT/5jTj6ouGfHNfVkgKLSBJ6D7XH645W+Y9LVWj0KDxzTP3AqGWvIdXtukrcbChHkH+f1cUtJWs6P+DBWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXLO2X23kWck4GZr4QYO03MHdE/+QBEc1aScMk3LatE=;
 b=DIckDM1TMYPU4/vh3FPJ7iS7UiwjZmFP+GzmUrWWjnWDmiQLenl3k5IwZ11GRpLUFewgCF/ADgsTKpcGXufbb8YsiG9PVY+KClM9HH50MV1/vgfa7LQMSbg9L0GyvZBB6q15PDvf5Z7FMEcGFZlk3aGrySfQ1lZjN8HberxoXKjVu5RJSJ/Syh9HUW51HE1cUEOEW9Qhqw1eYRlf5wTeEIRlQOJ+9dy6z5cxHKLVFfDrK5LcQNkMcLoZxoS7PmQN2Ic71zkiyWT4mbJHGUp+krNkVUf/F1AVaz9pyVDlpv21ukk2Km7cXPjZ5YUKLvpv4e2XpXtyzBUB8CM1Sjiq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1506.namprd12.prod.outlook.com (10.172.24.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 14:22:08 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 14:22:08 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Topic: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Index: AQHVQWICaYcQd0EK4E+7K31JCWSbdA==
Date: Tue, 23 Jul 2019 14:22:07 +0000
Message-ID: <20190723142156.4863-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8794f5ac-080f-41a5-83da-08d70f7924a1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1506; 
x-ms-traffictypediagnostic: BN6PR12MB1506:
x-microsoft-antispam-prvs: <BN6PR12MB150614384D497430C49D8B7C85C70@BN6PR12MB1506.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(189003)(199004)(64756008)(66556008)(66476007)(305945005)(66946007)(99286004)(102836004)(6506007)(386003)(2906002)(14454004)(68736007)(86362001)(486006)(3846002)(7736002)(26005)(66066001)(66446008)(6116002)(256004)(14444005)(8936002)(316002)(5640700003)(50226002)(6486002)(478600001)(53936002)(6916009)(52116002)(6436002)(36756003)(2351001)(186003)(5660300002)(71190400001)(1076003)(4326008)(476003)(81156014)(25786009)(81166006)(6512007)(2616005)(8676002)(2501003)(4744005)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1506;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ygym6lBYseWJfxFnIQSSzzz3gioXBYSTEGR198zD48TXIGETZFbAAy8Nl8guOnUXdRP9+brujzJz50OdERzpD+yKxnLzpxQn9BCCeWammx1OGkFP4o1a9WR/Tx/4oxAueATHhJhXPyOyEhwUSSGVU6lJxu9IavL+Wx5p0fYYdXYQnaq8W4uoDFOMXVthofwHKv1uAv6yukJzhuAcdtLFptIk/lZkEFXnJ9ure+3F1j/la9cKnbZpzJKPI/l3kiMjAfMjbd+QppH5NOqu1JuT+tUaFhfJMYWFI7kIFDDL4wF748Nszjdj+Lh8tQiGRhg7BtwUZ7ubPhCIAKHF7NWNopYbZGBw2IaNuONTsdMzVM5tos8LAj8lO1lB8Q7enS06gHBM/0iTDPwFOLoAkvXAbFXPgnZ7LnUErmMIvW8VHkI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8794f5ac-080f-41a5-83da-08d70f7924a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:22:08.0307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1506
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXLO2X23kWck4GZr4QYO03MHdE/+QBEc1aScMk3LatE=;
 b=Lm4SFW5OiNkKpDDwFY5a2nfTPBcRij/HA1A4NBq8upXYllg+fVWK3iIbTyP+sNMJa/AYa4qNnKmqmg8A5+DewZVraeiWbkDeImhClgqjfShl+UKusZP1CdN05jpkKVd80Vc+CEwwLWE9u8+yZiTypYPtwYiVeV5OGVrnLw3aSeI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB3YXMgbWlzc2VkIGR1cmluZyB0aGUgYWRkaXRpb24gb2YgVmVnYU0gc3VwcG9ydAoKQ2hh
bmdlLUlkOiBJNjFjOGZiYmVhNzczMzgxMjZlM2ViZGZhNzRjMjg2YjY2NWJkZDY3MApTaWduZWQt
b2ZmLWJ5OiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IGY1ZWNmMjhlYjM3
Yy4uMzE3OTExN2FjNDM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jCkBAIC0xMTM5LDcgKzExMzksOCBAQCBpbnQgYW1kZ3B1X2FtZGtm
ZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAogCQkJYWRldi0+YXNpY190eXBlICE9IENISVBf
RklKSSAmJgogCQkJYWRldi0+YXNpY190eXBlICE9IENISVBfUE9MQVJJUzEwICYmCiAJCQlhZGV2
LT5hc2ljX3R5cGUgIT0gQ0hJUF9QT0xBUklTMTEgJiYKLQkJCWFkZXYtPmFzaWNfdHlwZSAhPSBD
SElQX1BPTEFSSVMxMikgPworCQkJYWRldi0+YXNpY190eXBlICE9IENISVBfUE9MQVJJUzEyICYm
CisJCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9WRUdBTSkgPwogCQkJVklfQk9fU0laRV9BTElH
TiA6IDE7CiAKIAltYXBwaW5nX2ZsYWdzID0gQU1ER1BVX1ZNX1BBR0VfUkVBREFCTEU7Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
