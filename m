Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5F8A7F1F
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 11:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A698933E;
	Wed,  4 Sep 2019 09:18:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE75A899B5
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 09:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bF8CXKtdPP8IL8mYG3QcLyODVxPiN4AR+bF0o/624QuBLPHBPwLfeME3Cdwco7dAP+ANzcVhTmwwfM2nUKhr/xvtJ+30yrtpzo28AKX2iope8OVPxc3tmfHjXrKhIcODUCCUIHIEodf+6bbSD5uvv6zkIp7YKdSXarWiq7B52soKa75YzpAAl3SfBnMAmn8OyMamwjefsC5LVI66nJMYyBAhxUjCZdvNZRahgUbyvHtV4Udkm1rdCOmIoXvzTJHOYUgfL16vNwtLEoNbsGW84lnWRlDUohsLopQj/ZggZeZxXPArQ2CCKywby2uE0gfTRo6jSLiEcJ/ss1+vn/0fIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTt7+GXBxN20C8U3MYFOKhqsaT9n9cNANMu9YerxQFg=;
 b=MdgKJMYvWT101Ky/qnG13mh4HH2I4To0HD8UxbqKgGdtckdrM7QYoOM6a5jIJlMupv868WnS+jyClZq7JACtX5vJE/9B+HLOz1P+nxSs/ScsaPGiwE5kFXVTsKqHU9NWimOZexKxj0KLSSUVU2muJ6xaJaUm0w8gt5usAWrhMHtM4K+8/9AzuMsGpGJd8d8jv7FrTVtT4/kvLP1VKxbEhhg0+xRAQFosU7vhvBc1Tecfp4QhZI4dS6zE/x5VyHHjq5hoirje6KSdZB5H8+hnnyv2s51N54Gj4DukdoXMa59iD8vpmHbfN+jVY6zo/Le/b9ZQka6KKOlEuMX0HvCXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB3808.namprd12.prod.outlook.com (10.255.237.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Wed, 4 Sep 2019 09:18:13 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 09:18:13 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: disable stutter mode for renoir
Thread-Topic: [PATCH] drm/amdgpu: disable stutter mode for renoir
Thread-Index: AQHVYwGt6LIghn8MXU2QjAF8ZHakCA==
Date: Wed, 4 Sep 2019 09:18:13 +0000
Message-ID: <1567588678-26926-1-git-send-email-aaron.liu@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To MN2PR12MB3838.namprd12.prod.outlook.com
 (2603:10b6:208:166::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a183ac8-6fec-40a6-064d-08d73118cfd5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3808; 
x-ms-traffictypediagnostic: MN2PR12MB3808:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3808ED77F06DE296290E07F1F0B80@MN2PR12MB3808.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(2351001)(14454004)(4326008)(386003)(52116002)(71190400001)(478600001)(186003)(71200400001)(316002)(6916009)(50226002)(6506007)(8936002)(8676002)(54906003)(81166006)(81156014)(305945005)(26005)(6486002)(99286004)(7736002)(5640700003)(86362001)(64756008)(2501003)(66556008)(66446008)(6512007)(102836004)(6436002)(36756003)(66476007)(2616005)(2906002)(486006)(66946007)(5660300002)(6116002)(25786009)(256004)(3846002)(476003)(66066001)(53936002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3808;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ABhXF+qJiE9Klh3kSjiYC7eaJn5kMAdM+RMU0dMk2s/+QZjWHCOvVhuVZHACVkJCIUM8LMEdVDuh5cp5BizYkSJstMviEu35csFtiuKacmcT1p7+NWSckOMJBaoWz54xWyfWUfmJojqUq082WPC17b5v4oQq+j8o7hWFk4T9c2LzR41W3La1EMemea6qNj8mHx5vsCDQ29wb31yy4w7Tn5TqItkfD80CoojNA+odpYNkALOvb4IDpeovOwQwR7hGS/aJoh8Pf8mY/vMwCDKJDUe+JUSDvqsA9pKRBu96ROzpkwos5jpqvatw0H1L7axnKApQtNB36wRmrIsDdEGvKHBCJIgcYQ+yuY7/0/ETXElkn5fL+VNVrbHFE2Pdhdz8bRPFod3F9ooN9ZHkGuGsDr9nc9kiifaX0Wgj1XkorHM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a183ac8-6fec-40a6-064d-08d73118cfd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 09:18:13.7062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/PZFrS5w8zBCE1fiB4BPOVgMJF04IU665ajmUpsBj6xdX41BS2QAEu+CewmHnRb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3808
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTt7+GXBxN20C8U3MYFOKhqsaT9n9cNANMu9YerxQFg=;
 b=xyhtNJjzs9UQm4RbM04/MMl+ulINCu9pb7MFyUp9IA0FU3lcjhPzhP/2nO43QD5TgxVE0fUwTegIU7Zny7afc6oyTbo6RMd+U8tN4+Thi+bs2mamVZWbo75UKpfTd4Skm7HJUWw7MNhFhUnV7suseI5rY6Oga20nXeW7V/t5qw8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
 Ray" <Ray.Huang@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCBzdHV0dGVyIG1vZGUgZW5hYmxlZCwgTk1JIHByaW50cyBmcmVxdWVudGx5LgpEaXNhYmxl
IHN0dXR0ZXIgbW9kZSBmb3IgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJv
bi5saXVAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmlu
ZGV4IDcwOGQ1OTUuLjhlMmFmMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMjUzOSw2ICsyNTM5LDggQEAgc3RhdGljIGlu
dCBhbWRncHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCiAJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNp
Y190eXBlICE9IENISVBfU1RPTkVZKQogCQlkbS0+ZGMtPmRlYnVnLmRpc2FibGVfc3R1dHRlciA9
IGFtZGdwdV9wcF9mZWF0dXJlX21hc2sgJiBQUF9TVFVUVEVSX01PREUgPyBmYWxzZSA6IHRydWU7
CisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKKwkJZG0tPmRjLT5kZWJ1Zy5k
aXNhYmxlX3N0dXR0ZXIgPSB0cnVlOwogCiAJcmV0dXJuIDA7CiBmYWlsOgotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
