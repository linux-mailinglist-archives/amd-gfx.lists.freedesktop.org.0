Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD382BEE
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E245E89DB9;
	Tue,  6 Aug 2019 06:46:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910F389DB7
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/EhJFfpgrPegcJm0LlmqKAis5/HbSQvHVtlw0kQ0tfw/EdRl2fY4ifYWBWOz6Ij94pqZNYkIRwViSMK5kdtsHM2MlyCdOytSX/dxaInQcbxbT9EAKUEjzmxQ2dz79vDfZzrWf9ECdD/YBD8G8nE0WAqHCBZUWof8GDOpjCxYwEUwdOxFWpqrAhD5xQ+3F1mBHK4FisGuu4Cf2qvhT9vBBj7rBlgk9Rps3u2S0zlnUeOrqdwSDzEIkJwd2ywA+sS9NeEdusX+anB1E9/bSzixtocWnw5gV1/YvJPQ1zoAxyFn60gadPqXuAlyBy1b83ctn70BB1jGcDVnnBbz64gdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rlu26JbPHUTACc/l0FfnMNVHrFnP3JFS6SKRPn4zXg=;
 b=mxDtpUV4nw9h7GeCyfBQL+uLClWYidyLKFEq3V02WRt+WDvGQLpVcw/siUTAh/FKBh642N/ZVeJhrmgvpd9ujsihsXFSOtp4Vgb281o3caHk3BCj66MdxpKG8ez65k0Ik/fHiFk+AD+GDxtShl4kDTjpYe9ppa58PODLL+fENp0EoN+bA6MClOnxTe2aEPUKaOJmMt+m0DgBuQs3x/1W12vHXf/NcWDtaJmfZmxg9Xo8E9QkvBew7or192GYa85qzO1VgYnCZOllOODLkkoHjlpV/5BxHmeHkgHjfYlheUAI64GQroQHsZqBbeLk/2uaa8RLd6F5FCohLT0Lvkn8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:26 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:25 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/10] drm/amdgpu: enable hdp clock gating for navi12
Thread-Topic: [PATCH 02/10] drm/amdgpu: enable hdp clock gating for navi12
Thread-Index: AQHVTCKqS3vYsZdgOEWsJ4bE44LV/g==
Date: Tue, 6 Aug 2019 06:46:25 +0000
Message-ID: <20190806064546.19434-3-xiaojie.yuan@amd.com>
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
x-ms-office365-filtering-correlation-id: 634b3357-a01f-4701-c372-08d71a39cd39
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540A0144478C953C412602589D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(54906003)(446003)(26005)(76176011)(11346002)(2616005)(68736007)(14444005)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(4744005)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uVs9WJ5h8Ldl7AQmcfFA2Cjcauz2tG5qOMlOVYvBA4Fp0UNWUQ23PIuYbzXfVEnUXhPWqD4rWF3IblLKuwUfmBQFmu9v1NdIPVnyCOUGWtCpbdvEzd+45lES8+1g8HNKwfMc9goMZ6JKKJub2mEQ++kKLygxP9FQoMUXkhctXH8scSiAugDjxT7a5B851lhIOWayb8r1ftgZvUdcLqgcNM7SD4JEuf+47aavxmYKg8dO00RB/XWLDsLzVCVAu985yP/w3SPYNIUUrpCfauvf+yNEJQWu0g5QRazgg82EUrDpssbWfn9Te0HL+E9nDw0pLDctlwgfZnW/jrbbsMzZ9bo4XeHsGizhS3pLE1EwAMxYnx1ay3NGWEuLhMZBNoEpHN9RLaJb85gO1ZLhXrsIbMtrJWU56Q7okGhM3Jl3Imw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634b3357-a01f-4701-c372-08d71a39cd39
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:25.8435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rlu26JbPHUTACc/l0FfnMNVHrFnP3JFS6SKRPn4zXg=;
 b=z2rrQRwQ4gifALPgcplb/QNcFbCPcbsanSpFVX2t3Q+Dj3nF2aACCNCAMGgNjJRul8yMVK0l1AKIIzFEPPDX7jLDEYuI4cnlQ1+9UVJ7t9mmiwJWTFGgB9NGuafVzNx2LMtwrqrlexkgB7g4MSqxXYza9G2l2lVzmQmIzpKpqyE=
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

ZW5hYmxlcyBoZHAgbWVkaXVtIGdyYWluZWQgY2xvY2sgZ2F0aW5nIGFuZCBtZW1vcnkgbGlnaHQg
c2xlZXAKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5j
CmluZGV4IGFlZjdhNWIzMmIzNC4uYzQ4Yjg1M2JlZGNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMKQEAgLTU2NSw3ICs1NjUsOSBAQCBzdGF0aWMgaW50IG52X2NvbW1vbl9lYXJseV9pbml0KHZv
aWQgKmhhbmRsZSkKIAkJCUFNRF9DR19TVVBQT1JUX0dGWF9NR0xTIHwKIAkJCUFNRF9DR19TVVBQ
T1JUX0dGWF9DR0NHIHwKIAkJCUFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUyB8Ci0JCQlBTURfQ0df
U1VQUE9SVF9HRlhfUkxDX0xTOworCQkJQU1EX0NHX1NVUFBPUlRfR0ZYX1JMQ19MUyB8CisJCQlB
TURfQ0dfU1VQUE9SVF9IRFBfTUdDRyB8CisJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTFM7CiAJCWFk
ZXYtPnBnX2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfVkNOX0RQRzsKIAkJYWRldi0+ZXh0ZXJuYWxf
cmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHhhOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
