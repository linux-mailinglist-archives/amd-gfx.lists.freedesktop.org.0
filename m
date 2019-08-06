Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7009F82BFA
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E480489E65;
	Tue,  6 Aug 2019 06:46:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AB989E65
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpOlRcsnxLipVen6aWN+eCc5+Dttd04H8C47Cjh29Pywx31V8WVDUebFGBoHBFAy7dn6AjV+RfwH2lni0qSW2ro8YvhvjYRyUDMyHxLDsk6+qIpvxR6FwCu6gtKTYC19ag1MyKHCrnp2Ybze0+3ziqwesexpD0fiJJUh3NrDpG51xJtiUL0cJTQcRQfw+eW5VHrW2CuZ7KSp/b78ZkUjX2qSWKK0H+E8gv6XewOpIF0j/REeMYusnx5KCS8z2vtJ94as7qAKVSwUbN/E0lbcrzgRQ7jRsx2Y/xFxX0kjBdvmmREv0PBf8Rc++eqm1kknS7VVE62WRhl7t66yWOPVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHw8TtIoRVRfEfAomF1JpIC1+zptbHal+Lal8T7ycb0=;
 b=Wd3PuMd62xEsfP8ZaWCZ8FanSUornLnex+oJl497bNVTcasgpsnFp9g+1T8yFFPsvT0406ofDLgjHl+Nwgu7PKjduBKfV+/2txr0MMpBx9avu6j4xF9HDInNHphx5mN88l6Ii5rYxJ87tir4HIsp20pLPA3E/ln0aT73VQy82b9cpst4IUXMmacObbJjz1Lfa1B6ZxdjpTcpB/B65ekLOltHoWM5Aa+5jjqZPYzUSN01v+kN1z3CPdL6R/sN4vZU0RO0dPdDSRlSEtd4WgSMIARBe9oUz0weFF8ZHjyhUd0LIfE7O0kyK2/tsDczO8UEFw8ZVHP5HOp5mNbw7WIljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:44 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:44 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/10] drm/amdgpu: enable vcn clock gating for navi12
Thread-Topic: [PATCH 10/10] drm/amdgpu: enable vcn clock gating for navi12
Thread-Index: AQHVTCK1+4Wub7E8DE+FvyJGAlM+0Q==
Date: Tue, 6 Aug 2019 06:46:44 +0000
Message-ID: <20190806064546.19434-11-xiaojie.yuan@amd.com>
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
x-ms-office365-filtering-correlation-id: f5f8db04-bac3-4b00-7839-08d71a39d816
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540CF034D7CDE90719D1B6089D50@BN8PR12MB3540.namprd12.prod.outlook.com>
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
x-microsoft-antispam-message-info: /tiPtTPnbXhnIrBrIoxVYl4S8SjF8KSf474Zp+vo5/fN3CMHTQUaoIfDcCDRxmELpojTpck+3DLsN/gUh/cvmfgKxJKqFXwKqaG3RanrBg/Xatb68tvqpyenIigSyqUDHNXuvKmDDhAaDJSRAWkQLI6jjecOYW3z5ktssjhecWsVoKX6t1rzOU/6ZM+32J+EOHLMTNzajuOgTxFa/VLyTmLS6HKJV+lcs0Quy+/aUmx8ciTrua5s9FIrDaLFNXLUuvgaWYPilQOhwfUibRojYiPa2+ZdzDG1U6Af14vpwN6p62W6/XF7okvj0dw+90UWW7s97q8gANguomrYWy8XBwqKNr8tczukXLQgJkWxF0JtOO9Z5nPSuKh/J8CAbzNP4kti5JCRZlaTtr7Jy+yNWMq3cDoIEwPb1aJ2uhUTerQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f8db04-bac3-4b00-7839-08d71a39d816
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:44.1021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHw8TtIoRVRfEfAomF1JpIC1+zptbHal+Lal8T7ycb0=;
 b=qlW1GFHOswGuVJJsAJQAmIGf9G9nBzDqZRqbjgdHshQ56l4ZNKRzpRVXq/gBmTftIp7eKaDu0i9x20Ah3N7kHqvc/W8GVcq1IelFug70xIgOBeJGEFsz1/6jg0vHa+KZybLUX1pSqMlrRlJlVhYS0j+iOsGNRLyASXg7A1zZkqs=
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

ZW5hYmxlcyB2Y24gbWVkaXVtIGdyYWluZWQgY2xvY2sgZ2F0aW5nCgpTaWduZWQtb2ZmLWJ5OiBY
aWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L252LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IDMwMmM2MGIxNDE5Ni4uYTEz
MDMyZmRlNWY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTU3NCw3ICs1NzQsOCBAQCBz
dGF0aWMgaW50IG52X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCUFNRF9DR19T
VVBQT1JUX01DX01HQ0cgfAogCQkJQU1EX0NHX1NVUFBPUlRfTUNfTFMgfAogCQkJQU1EX0NHX1NV
UFBPUlRfQVRIVUJfTUdDRyB8Ci0JCQlBTURfQ0dfU1VQUE9SVF9BVEhVQl9MUzsKKwkJCUFNRF9D
R19TVVBQT1JUX0FUSFVCX0xTIHwKKwkJCUFNRF9DR19TVVBQT1JUX1ZDTl9NR0NHOwogCQlhZGV2
LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQT1JUX1ZDTl9EUEc7CiAJCWFkZXYtPmV4dGVybmFsX3Jl
dl9pZCA9IGFkZXYtPnJldl9pZCArIDB4YTsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
