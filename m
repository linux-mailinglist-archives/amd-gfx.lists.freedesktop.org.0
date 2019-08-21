Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE797D0A
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 16:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4536E950;
	Wed, 21 Aug 2019 14:33:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB4089789
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 14:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCUlB4jMbZdilr5/CHCd2PkGfky6Q8hyBUZ3gkDjxsoc4/+usIH0/hNRJDUpbTC7ponruUxGN9ODwgwFGsnZdt/ARnECtRbluGHZSHaRlsKUZQdToRSoyn1TqpQYPjIvbUJPA/xqYpdU+WA5WcPCVPEq/uyzewjOEK5JJcoBVFoN6KxPAhvPT2psbSmqLz0mPouDGcEiWTVMByuLjZQhxKu3iroPXazFFoNePmzGamjbhQyTOA3uA3hgkuWRxNqkKTHvGLCNbrR0pVoC4/oR5Zg/dFecDUxHPmY5QJsptqP3b0Oq6IwsC/rG8W6VYaZQDPaGcDEeR9PgZd9g8Bhp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Li5CmZE6uxdtA0RspyHWxvLB4MXcrke1dTKeV3HwP0=;
 b=aPyBHvp+MuQ8A8qmLKWGUVJtIURxdO56C2xUJ4qGfcRUK/9UCH3+rSwrl/xD0psIdnJA+ts8O2FPbH1TIHPIdivcMFON6Jfxlo6BBUGJm/CwSRCltmi2ent04uRWCqddeYHBiXCwt+P1+/s36j5NCInORHiUaXJcdP79K/NtJOQcCntCTmiOCvtLjTfQ1G6NZmkK+XsllCe5PO1vAqmfsW188PEVxf+pD6gvC0pvjVvR/jwHPGfXONkbHuNKbgSLJ4LTseABp9/dNZ7hCWoLB9wo/J8Gbrt++bl0R7LLr6yuVJUSFsjJdcbKDy+sF/0+wLJxcZVxCNDS+SpKxSmxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1428.namprd12.prod.outlook.com (10.168.229.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 14:32:59 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 14:32:59 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Modify sdma instance number
Thread-Topic: [PATCH] drm/amd/amdgpu: Modify sdma instance number
Thread-Index: AQHVWC1U7bV89IdX1EGq4r88cllMeA==
Date: Wed, 21 Aug 2019 14:32:59 +0000
Message-ID: <1566397966-4357-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d471e27e-1fb3-4815-1408-08d7264476d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1428; 
x-ms-traffictypediagnostic: BN6PR12MB1428:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB142824054E72D0A62BFC27E8FFAA0@BN6PR12MB1428.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(199004)(189003)(476003)(7736002)(14454004)(256004)(5660300002)(8676002)(6916009)(53936002)(52116002)(14444005)(25786009)(2501003)(486006)(478600001)(6116002)(81156014)(81166006)(8936002)(71190400001)(2351001)(71200400001)(6486002)(2906002)(36756003)(386003)(66946007)(66446008)(6512007)(66556008)(66476007)(64756008)(3846002)(4326008)(102836004)(6436002)(305945005)(316002)(66066001)(99286004)(186003)(26005)(2616005)(5640700003)(6506007)(50226002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1428;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HHkJDyaI0d1qo/sUVnJTCKj5WFwjlbYodXeZE+/ZJrPhJla7m/O6ud7RiElE4S+IT870+IoU9FkMiTJvD7lL5tWrBF2O1qjpWf4btlPjXVa+jBUUXYoc7sfbeFELrxiPG3RgHf7lG+0Rc1LTR5dV5d1oZ1fMAtQX0F8StdeMi76PAMyfQFU3DztYZApSLSfbgDlGIzgYhrEokZz8BdDvRE+CPdNpmOWkmdvgG6u4LCoABTl/GeQEyrOlR5/RLjj5lv0NxZG5GKCPUu81G0H1Vu7ENapgBOZtf2OiAH1NE1+73++RMuvER/09b5DXPCgXyjuv91/G+FwDTFcojaUIERq05TrAy5LxAwm1xaU3nzIZb0aycYfn1fb/fNyY/qOgEXhc11/5TqzpJP0wVTzJuDooXmfi/Mh66Y5Q5TvUJzE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d471e27e-1fb3-4815-1408-08d7264476d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 14:32:59.2696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgmZvOV+SxVyg7QQ75n9D8j0DVD0xkoDYZJTwyozefFQ3QG3mwLnp5bquDaDX/dN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1428
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Li5CmZE6uxdtA0RspyHWxvLB4MXcrke1dTKeV3HwP0=;
 b=2FIVtpGR0bRWyWavWh6aqnMfE5HlwOIHaxJ5cC4LOVkpqc83Y8Nx1yPkOCKbxWZbb4ZDwY6yADjB61dpgCqu/XEr2CCaO8oZrr+SEXUNMXbIa2XbF29DENGLDUfI4A0twvniqUbt04Z1sMn2Qm5/qyrV6F23OL1Gdd8Xo6g2Y1I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Gang.Ba@amd.com; 
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG8gdXBncmFkZSBwZXJmb3JtYW5jZSBpbiBzbWFsbCBiYXIgbW9kZSwgc2V0IHNkbWEgYnVmZmVy
IGZ1bmN0aW9uCnJpbmcgYW5kIHB0ZSBmdW5jdGlvbiByaW5nIHRvIHVzZSBkaWZmZXJlbnQgaW5z
dGFuY2UuCgpDaGFuZ2UtSWQ6IElkYTYzNzc5MTRlYjY4YTE4OGY3NDVlNjM0MDlmMzQ0ZjBjZTFh
OGM0ClNpZ25lZC1vZmYtYnk6IEdhbmcgQmEgPGdhYmFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92
NF8wLmMKaW5kZXggMDcxZDZjOS4uNWFjYTliYjRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3Y0XzAuYwpAQCAtMjUwMCw3ICsyNTAwLDcgQEAgc3RhdGljIHZvaWQgc2RtYV92NF8w
X3NldF9idWZmZXJfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJYWRldi0+
bW1hbi5idWZmZXJfZnVuY3MgPSAmc2RtYV92NF8wX2J1ZmZlcl9mdW5jczsKIAlpZiAoYWRldi0+
c2RtYS5oYXNfcGFnZV9xdWV1ZSAmJiBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXMgPiAxKQotCQlh
ZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19yaW5nID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbMV0ucGFn
ZTsKKwkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfcmluZyA9ICZhZGV2LT5zZG1hLmluc3RhbmNl
WzBdLnBhZ2U7CiAJZWxzZQogCQlhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19yaW5nID0gJmFkZXYt
PnNkbWEuaW5zdGFuY2VbMF0ucmluZzsKIH0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
