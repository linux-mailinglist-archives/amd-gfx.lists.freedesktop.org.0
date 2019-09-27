Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4658BFE2B
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 06:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B1F6EE47;
	Fri, 27 Sep 2019 04:33:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800078.outbound.protection.outlook.com [40.107.80.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212456EE47
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 04:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzX4o37tBpn6N92ey27WicjE/4o650WUlmvmJ0WHOI5mrzLyU/XAkZoSUduuOrKLeFMgFIrzRHNqvdoPMBs9KOz6RTo2NhDmMaNMZ0YlBS7JoSO2bIot5DY9A5Alt5SFseG3OotqxUrZTxHdOsecFlq6eLBFP9arf2UlRC9YMYODGBk0iFMjhAvl+dxlu5YcFbVS2QKE3vvsRSJvifrHCjG+1Jse4OI0yXIjDdlgqnc97iDB/VmK42TaHI77JHC6Gk9+7y7SlvZBzaT9aUXt7CciVBU6SPJPQRrTLcplLcXsULT5MI1Ve4gz0Qz3cEB7upxoF1YlmrluAXM277blCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFP+BlLv9NWNRiVAQQqEx2qSgK9pknJfwyEpYeFPDj8=;
 b=k4EiqoF8bZLJKYQb/vmQD6bflwnjNQXKjbbl/ObnHMQmKNX8hPaDer5g9AdIr4D3jG5ws/T8b93X47m8qWkGH2Pzqz5BTgVwrjWK6ycd2qz7H6WaAPO0mOZ2KiQb8I4iG6BvxVbPYaUD4OooJm/D1lEvmzVeueHXxNIPkdyk3el+lILPN8skRwVfb8vOBvBoDsnwhWtqghEV5SGIQOVDyruSERa2I5WGR55l6BhtmdUUZY7smEntQn5u8rTy6oU8qc23W0o43EYfk+EbKldnZ39fecY8tLsYJAdiXURRnfoSoMSc98ddO4sHsLEh0Ql6BySrZRdIeCrxRoUnZFJUlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3901.namprd12.prod.outlook.com (10.255.238.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 27 Sep 2019 04:33:36 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Fri, 27 Sep 2019
 04:33:36 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition conflict
 error
Thread-Topic: [PATCH] drm/amdkfd: fix kgd2kfd_device_init() definition
 conflict error
Thread-Index: AQHVdOy5Gdeati0HikqkW7SHta/wuw==
Date: Fri, 27 Sep 2019 04:33:35 +0000
Message-ID: <1569558805-30951-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0063.apcprd04.prod.outlook.com
 (2603:1096:202:14::31) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b7a44cd-069a-44cd-76b8-08d74303dc3d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3901:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB390158AFEF9A8C4766F9B3ADFB810@MN2PR12MB3901.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(189003)(199004)(8676002)(3846002)(25786009)(256004)(476003)(2616005)(316002)(6512007)(36756003)(486006)(4326008)(71190400001)(71200400001)(6486002)(6436002)(2501003)(66066001)(386003)(2906002)(52116002)(6506007)(186003)(6116002)(5640700003)(7736002)(6916009)(305945005)(26005)(14454004)(99286004)(102836004)(8936002)(478600001)(50226002)(66476007)(66446008)(54906003)(66556008)(64756008)(86362001)(5660300002)(81166006)(2351001)(66946007)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3901;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SNfZ+QJmN8CG4GIQfZoqdIPF7ejTBxIis1fK4nswafn3LhT2lE05LxB+WoOiJMy0ZUePaj8xVyz26M/vzqSvak1mUqVm9FO0UaDmTJFJrRKy4C6hTReGH01bftgYA1mGIaWo7p8jyYMD0xW+NTQS4maqgLNazFait1hOmYG1ZKJvh2cWhPaa96WmMn0TdZtEZ51EsZmu3Gf5AM05j6ZJzPykPjXk3Sn4scIaJJnWx7Amuco+0f4hr/U1A01BHIzAAYtIaifj88PM8QTTW1ZtHtmTq2yuvs9dmOCopf6F0dTiKJVRjhwUggjnDMilEa6qJ4f9xyoSgpOQ3LWqlGEKncqlTaLdkbFXBc/6yfZGWDSPiYzAUYPMnB61nlEh4ZDDNh6pih7eU+htvYermVtjlSRtGlQO5YNWw98axtcc8z0=
Content-ID: <E83324FFA663FD42BC7C5BBA966DDE50@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7a44cd-069a-44cd-76b8-08d74303dc3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 04:33:36.0220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCX3Q/vxpPvE15n7XFLWGya4aHL3r3jwicDWOL6COqQhHuO2nzEf1tb18iRTApd+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFP+BlLv9NWNRiVAQQqEx2qSgK9pknJfwyEpYeFPDj8=;
 b=b9KMjHhUUyhnSgqKBU7yKISPvQrlNNI72mixR2kLNuTLabkQnyX0hHz+Gf0bG6EKcTJIUldaFK2M7HkB8E+scFrf0SsSRdMD/K+oY5d7c2MhHgLhR34SXw4kzt7KlxpXxXJ0ipnfwEFUVTy5hKg/qwbQ7HJzgCUzXj5J1AKi3eQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>, "Liang, 
 Prike" <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHBhdGNoIGM2NzA3MDcgZHJtL2FtZDogUGFzcyBkcm1fZGV2aWNlIHRvIGtmZCBpbnRyb2R1
Y2VkIHRoaXMgaXNzdWUgYW5kDQpmaXggdGhlIGZvbGxvd2luZyBjb21waWxlciBlcnJvci4NCg0K
ICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly8uLi9wb3dlcnBsYXkvc211bWdy
L2Zpamlfc211bWdyLm8NCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly9hbWRncHVfYW1ka2Zk
LmM6NzQ2OjY6IGVycm9yOiBjb25mbGljdGluZyB0eXBlcyBmb3Ig4oCYa2dkMmtmZF9kZXZpY2Vf
aW5pdOKAmQ0KIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLA0K
ICAgICAgXg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly9hbWRncHVfYW1ka2ZkLmM6MjM6MDoNCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly9hbWRn
cHVfYW1ka2ZkLmg6MjUzOjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmGtnZDJr
ZmRfZGV2aWNlX2luaXTigJkgd2FzIGhlcmUNCiBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3Ry
dWN0IGtmZF9kZXYgKmtmZCwNCiAgICAgIF4NCnNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjczOiBy
ZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvL2FtZGdwdV9hbWRr
ZmQubycgZmFpbGVkDQptYWtlWzFdOiAqKiogW2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly9h
bWRncHVfYW1ka2ZkLm9dIEVycm9yIDENCg0KU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFBy
aWtlLkxpYW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmMgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYw0KaW5kZXggMjIxMDQ3ZC4u
OTI2NjZiMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5j
DQpAQCAtNzQ0LDYgKzc0NCw3IEBAIHN0cnVjdCBrZmRfZGV2ICprZ2Qya2ZkX3Byb2JlKHN0cnVj
dCBrZ2RfZGV2ICprZ2QsIHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KIH0NCiANCiBib29sIGtnZDJr
ZmRfZGV2aWNlX2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCisJCQkgc3RydWN0IGRybV9kZXZp
Y2UgKmRkZXYsDQogCQkJIGNvbnN0IHN0cnVjdCBrZ2Qya2ZkX3NoYXJlZF9yZXNvdXJjZXMgKmdw
dV9yZXNvdXJjZXMpDQogew0KIAlyZXR1cm4gZmFsc2U7DQotLSANCjIuNy40DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
