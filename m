Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB421261
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 05:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A9B897D0;
	Fri, 17 May 2019 03:03:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440FF897D0
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 03:03:43 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2622.namprd12.prod.outlook.com (52.135.103.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 03:03:42 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 03:03:42 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: cancel late_init_work before gpu reset
Thread-Topic: [PATCH] drm/amdgpu: cancel late_init_work before gpu reset
Thread-Index: AQHVDF0Jw8Yl7UBkJ0q6lgb4fC+21A==
Date: Fri, 17 May 2019 03:03:41 +0000
Message-ID: <SN6PR12MB2800E10E66A5834D3A38A0E4870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.13.97.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78324475-3482-4e7e-448d-08d6da744488
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2622; 
x-ms-traffictypediagnostic: SN6PR12MB2622:
x-microsoft-antispam-prvs: <SN6PR12MB262249911C30B46E30714951870B0@SN6PR12MB2622.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(39860400002)(346002)(376002)(199004)(189003)(9686003)(8936002)(71190400001)(25786009)(71200400001)(6916009)(55016002)(478600001)(4744005)(102836004)(2906002)(72206003)(14454004)(53936002)(26005)(6506007)(305945005)(7736002)(81156014)(86362001)(5660300002)(64756008)(66476007)(66446008)(2501003)(66556008)(81166006)(3846002)(6116002)(76116006)(91956017)(2351001)(54906003)(8676002)(5640700003)(4326008)(68736007)(66946007)(6436002)(73956011)(7696005)(186003)(66066001)(476003)(52536014)(316002)(256004)(74316002)(33656002)(486006)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2622;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jU0ifCtewJzFMTcnIzXxhmjPWAHfIDb9zLAI7R/ZOsLa80ksEdhi1ifoonaKlGi56mkWvxkOTit1THdyylOM2eQAwkPD0eVwoRojYtib4kT+jEIc/kj5JAlupNaBRHREuGHFfB1zztl6OOaGDmtIiZ6SgwdDwrO7mXPWTnfSsDzdBs6SEvIRMUFyZrqQmsHZy6gPjzGCpikj9AswfqEjKIil49xELv6OrjsyzPpAQunl+3XFdw+yIwZQgYCP7Sll2OZYiRYhfuGXqxEiomN9cwHJh5JOBlW/2a0ZZYuHiKHC2mguFLhMI30yXx8WoL4lDL4M+xNTTUyCO7Rn6GLNvwCmpm2uDkaUBn65nw3iQc6F7udcGuBFGezOy/e1rb6Ep1m0dx3Facy0ih65F+eDDN5Q9ddT6cRKPCXMXvA0MZE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78324475-3482-4e7e-448d-08d6da744488
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 03:03:41.8907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2622
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPDNZ/6UK1adxY0cz/o7s+1iz9+ghX/kqTrargnqIuQ=;
 b=Fo+BUuOwRYKH0AS4yD4IgSnYewDm+9yS0k4FmCNgM5m1dTxtzTxh9lLsu9/cKzW1Q4vHBi0wj65Wd5xO4/zThQk0/mFo/ebKSaw6OBodkyC9n2wBEVAXRQ12iBN7q0cTiaJMIPOmnkeYrQ9Wslam0lj49I6y1AP83UZIi4WLonE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CmdwdSByZXNldCB3aWxsIHJ1biBsYXRlX2luaXQgYW5kIHNjaGVkdWxlIHRoZSBsYXRlX2luaXRf
d29yay4gIGlmIHdlCmtlZXAgdHJpZ2dlcmluZyBncHUgcmVzZXQgaW4gYSBzaG9ydCB0aW1lLCB0
aGVyZSBhcmUgcG90ZW5pYWwgcmFjZXMuCgpTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5o
dWkucGFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBlY2I5OWFlYWI2Y2YuLjI0
MWNkMmM3NTQzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YwpAQCAtMzYzNiw2ICszNjM2LDggQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAlkZXZfaW5mbyhhZGV2LT5kZXYsICJHUFUgcmVz
ZXQgYmVnaW4hXG4iKTsKIAorCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmYWRldi0+bGF0ZV9p
bml0X3dvcmspOworCiAJaGl2ZSA9IGFtZGdwdV9nZXRfeGdtaV9oaXZlKGFkZXYsIGZhbHNlKTsK
IAogCS8qCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
