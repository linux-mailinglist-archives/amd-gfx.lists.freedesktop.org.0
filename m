Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36905212A0
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 05:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9AD897E4;
	Fri, 17 May 2019 03:48:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36E897E4
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 03:48:23 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3983.namprd12.prod.outlook.com (10.255.238.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 03:48:21 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f%3]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 03:48:21 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: keep stolen memory on picasso
Thread-Topic: [PATCH] drm/amdgpu: keep stolen memory on picasso
Thread-Index: AQHVDGNfqErXdbkrAEqfy6rTDm0GVQ==
Date: Fri, 17 May 2019 03:48:21 +0000
Message-ID: <1558064879-32517-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::20) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cff74b50-1829-43cd-3204-08d6da7a8138
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3983; 
x-ms-traffictypediagnostic: MN2PR12MB3983:
x-microsoft-antispam-prvs: <MN2PR12MB3983C56F165BF12E53C8D87BFA0B0@MN2PR12MB3983.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:60;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(136003)(376002)(39860400002)(189003)(199004)(316002)(305945005)(71200400001)(52116002)(2501003)(25786009)(6436002)(7736002)(14454004)(4326008)(186003)(6506007)(68736007)(256004)(36756003)(71190400001)(5640700003)(4744005)(53936002)(26005)(386003)(2906002)(99286004)(72206003)(478600001)(6116002)(3846002)(73956011)(6916009)(6486002)(2351001)(102836004)(66556008)(66476007)(66066001)(64756008)(66946007)(8676002)(476003)(50226002)(81166006)(86362001)(8936002)(5660300002)(2616005)(66446008)(6512007)(486006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3983;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iTYpuO7J4mdEJK7oXpy77gTs6aXIDxvBGzKT/JGqI9XLn9TnnA5GSUh15um3KXqc0BWyu7YV335jNLXq+sRtskYRaYBpsBwyys+AoxXCXRZHeyZbArgttrK1hyC3gEeneS/HSpKv+ZmfKS6LUA8eLBt24gfYDTYOBbwEpPPsb4RKf39UPQykJDRLkBR5EGvWDjHpgNeGIE8j6TMZUFRDPlPfEvtGMTzovWLD4ZnvACiKJCoZ3s9iD2zEq/bFCNle569WobZM9JXtpOhBgjFzZlHruOIC6R82UPsPcyFG3AKWsnU2XW7IH/O1qR2l/Xo/Qex0R/lHwOJT/wsi0TJhM0A6AC845isbHUHQISTWmux5blgmZ6eDVHYciJsOw6gX0rA2wgrkmYOBwrZFLdRl6rAM6sbvFgMPXhkJnZ/QTrg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff74b50-1829-43cd-3204-08d6da7a8138
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 03:48:21.3879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3983
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUvm4OPtYh+J3OuAzA0HTQgrpY4qsYp0Bs9Xi55Mh5g=;
 b=UQPr2UhoDGTMSnq9VyIZae+nIXZa68LfVfReru3jA1VAPwLv7pGMOheur5Aa1cOgluYlJtD8iuED2PVvKx/utXemeJSWfLOa05mqqwXiv55iRXIlfnyFEnjo6BJ59H41Xrv09x5G2bUls+8vxDvfs/4dB0u6EeDZOOmp5Qr3fL0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

b3RoZXJ3aXNlIHNjcmVlbiBjb3JydXB0cyBkdXJpbmcgbW9kcHJvYmUuDQoNCkNoYW5nZS1JZDog
STczYmNmM2FiMGM2NjYwNzdkZmU4NTQzNmEzNDU3YTAzNzkzODIzMDQNClNpZ25lZC1vZmYtYnk6
IEZsb3JhIEN1aSA8ZmxvcmEuY3VpQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KaW5kZXggYzIyMTU3MC4uNWFm
YmI1OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCkBAIC02MjYsNiAr
NjI2LDcgQEAgc3RhdGljIGJvb2wgZ21jX3Y5XzBfa2VlcF9zdG9sZW5fbWVtb3J5KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KIAljYXNlIENISVBfVkVHQTEwOg0KIAkJcmV0dXJuIHRydWU7
DQogCWNhc2UgQ0hJUF9SQVZFTjoNCisJCXJldHVybiAoYWRldi0+cGRldi0+ZGV2aWNlID09IDB4
MTVkOCk7DQogCWNhc2UgQ0hJUF9WRUdBMTI6DQogCWNhc2UgQ0hJUF9WRUdBMjA6DQogCWRlZmF1
bHQ6DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
