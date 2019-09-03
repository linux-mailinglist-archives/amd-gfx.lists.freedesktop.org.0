Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53DFA5E5A
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 02:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1E289951;
	Tue,  3 Sep 2019 00:02:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800045.outbound.protection.outlook.com [40.107.80.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EDB8995F
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 00:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYY3y5Nizl63YUFYSrG9VnmoQ94zHtT88EgFSJy4QoDGizlWWEYJD7xtlKi37d/WGc6MdoZBVFow4YmN8thi6079zY5/j+4gGURuiA/ru98ggdcVGIpglHQ7cdbJEn2B8i35/jJTv9+X6lGUmURKT2TXDW90vxvj/WZENx4K+FFkbtQOE0iWx6lavwAEfsgboLZz2Cn33fkmVt5zkCv9wVsVNTdgBPaY8p4WXeiORI0JlsSEILlFj4KNHJoMyuiHUvNCc+dfJ+H/2DITSVZcSK4+3ahtIh1b5bxu/f2KbnqiB4nGxBi1e4kbbZOBZNOMY15X9QL1+3ixK6WId90d1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2Ya6xxnXMnPs4xZM7xeD4b6HulRidXOjgE6xlc2qRw=;
 b=QmjTbTf6l/nwkRvZQZiTtvmj3CzHWps77mRwAzaUT5u8CKbI0+IijzvxLwHBbx49GZHj2IEHJpBA/YOHo7AxFc4PSpbEfAMt0swCqFt6e8HoJaNQkd6HwXII//y0lqTpCh357hWjMmWMNkOIZvtyU2tAqzC/ZhIBMBrruflwJcYcMcJ65m4G0GIxpaJ1B2K4X2/8FrpK6o2pOvcdmx7KciYX8yRJ9MldrJxRiokdORQGsZx/5iVRqzuuFFeOO1sxdVxlagKp8/yXDnFo9xKo1ctrOkBGuNu5cvr65LLl6+FFM0kd+rGeFk3qXitB/TvDmIVEBZvdRWMdC4LPeC+idQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 00:02:21 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 00:02:21 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 09/10] drm/amdgpu: init arcturus umc callback functions and
 configurations
Thread-Topic: [PATCH 09/10] drm/amdgpu: init arcturus umc callback functions
 and configurations
Thread-Index: AQHVYerbtbWSlkXUtEeYK9bP1fyxcw==
Date: Tue, 3 Sep 2019 00:02:21 +0000
Message-ID: <1567468894-11852-9-git-send-email-Hawking.Zhang@amd.com>
References: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1567468894-11852-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::34) To DM5PR12MB1418.namprd12.prod.outlook.com
 (2603:10b6:3:7a::15)
x-originating-ip: [180.167.199.189]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4f5070f-5a57-49dd-d33f-08d73001fdf2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18184E74D91386F4FAF2C3C8FCB90@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(99286004)(66446008)(36756003)(2501003)(478600001)(316002)(256004)(66946007)(5660300002)(66476007)(53936002)(81166006)(26005)(8676002)(71200400001)(102836004)(81156014)(71190400001)(6486002)(66556008)(50226002)(186003)(8936002)(66066001)(25786009)(3846002)(6116002)(76176011)(6512007)(4744005)(6506007)(386003)(4326008)(86362001)(486006)(446003)(2616005)(305945005)(52116002)(7736002)(11346002)(476003)(110136005)(2906002)(14454004)(6636002)(64756008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ln6zEdLYRWSQprPKSUN5SHWDYhVp6vPGEX9KQ834rEmEOFDoLDfN/C3A2C+L7lYgfZ+KWbLLmrqefCTJCNP8kj/891PVJ9G30WBEWCBcKnA3MFnnvvQR5/OprKZBnrUoD1aPZddY3iT2vayq78hFlSBiBgEN4n7YWXXrgPBlrwjfN29pfPzZfdg/zSPyyqw3IYTsvaFZRqx3pa7iuyU4lmtfbxugysaoyjRDny2Pq0mTdndFNj/0NbBAdLy/HAro4D1uFoF97S6rtmeCqlH1T7PfE/X4nthaebjAFXsZ85pcV6WBtovWgNlioDEMCiEv+7qjm5mt/eOMluZrImPhrPM6i0v5CJhLM09O0QzloY5VJFGSpU+n4qgagz+ECbIJueQMLXZTJIo5H8BThaXWjVmhjRv8027uPKUwWRi2j3U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f5070f-5a57-49dd-d33f-08d73001fdf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 00:02:21.4202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUDnlCy2I8zZmrCvdwbjGdOGixLmWl2eEB3f9imr/VaK0GniIHFD+/wZrhmB/hG2SV6NuZSJ+IiYclYOc2IksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2Ya6xxnXMnPs4xZM7xeD4b6HulRidXOjgE6xlc2qRw=;
 b=xIxZ00PjDGCAtUmxN7IZkOwxlE6qyCpmSJFcdJHrbabbjlKpSjtTWP0g04nFXXabkQeCy+ee3S7ErQTYbXpFHeukCzK9Lb0iPj4oPns3cm9FmpL8LeL0rGp0tVBYMjUTan8bg1hoXqGO5kWI7/NEffqcwwCO8PO0AF53l83uYzE=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YXJjdHVydXMgc2hhcmUgdGhlIHNhbWUgdW1jIGNhbGxiYWNrIGZ1bmN0aW9ucyBhbmQgdW1jIGNv
bmZpZ3VyYXRpb25zCmFzIHZnMjAKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tp
bmcuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA4NjIxM2Y2Li5hZTM3YjA4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTY2NCw2ICs2NjQsNyBAQCBzdGF0aWMgdm9pZCBn
bWNfdjlfMF9zZXRfdW1jX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXN3
aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX1ZFR0EyMDoKKwljYXNlIENISVBf
QVJDVFVSVVM6CiAJCWFkZXYtPnVtYy5tYXhfcmFzX2Vycl9jbnRfcGVyX3F1ZXJ5ID0gVU1DX1Y2
XzFfVE9UQUxfQ0hBTk5FTF9OVU07CiAJCWFkZXYtPnVtYy5jaGFubmVsX2luc3RfbnVtID0gVU1D
X1Y2XzFfQ0hBTk5FTF9JTlNUQU5DRV9OVU07CiAJCWFkZXYtPnVtYy51bWNfaW5zdF9udW0gPSBV
TUNfVjZfMV9VTUNfSU5TVEFOQ0VfTlVNOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
