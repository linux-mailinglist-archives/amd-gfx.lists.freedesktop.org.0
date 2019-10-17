Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D801FDB517
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 19:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0BD6E061;
	Thu, 17 Oct 2019 17:56:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700079.outbound.protection.outlook.com [40.107.70.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1436E061
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 17:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAE9iwGteMwPCB9FPtTqWRJu2Z9nGzaI617VR+GvizfmZ+010qzdHL5i7bENXn6czPovzOifOeo9B0hiuHWLQ9r/ETHI7ojWNYXIS/qC0u2HXqQvQEl4op1tFG9pasFUVooCrrJKDTj+f2c37XyZM4eakUcR+9zwESyGjQtv/Ilw1MVPp11gwdNyQbgu9DeIh4x/uL/v+7JjzBiGkh9tIJDbPvCpTyGFNEJWSm5+dB4M9sE3AdzqtID9CJ5hrivFKZ6VTltMX5Y0qwFZwU1Fb+9LzWtzTCdvh/CeV9V4MnhxsRx1Ft03vwS6RjCJXTcL7qr7ogbpCWtxyYu7OEpfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfWJs9dPOwwbQ/8ij4/0YVcs1R4D17loOIxQJInE4bs=;
 b=bwx3JoYbjlDgwv/kVwp9fwZO9bvtifReECj5Hyza70grSUTYBUzJgkUXT6qTCcTLdePr2FdVw33Qi3sTRH3p2OpHBsuRae8LVSgdiomYh68b6LW46/FIdQXerRSwOdvI4fPWPbqinsXLjbcVAniiBmRl0ApQp6mP2sZ1c+VmASHw4fVfeD+YyLDCGr6D3k8hrs6VnYVzF9S7RAL+UwjxDtEKY6ck+Fpv/utKnarH50awGqTn8GUa/dua25yGzGrkmEaaYbUtPs9X705TaN64oy6KMPoCKFmf/T5k22S2MAT1CVeRElsZh3nb8c402JBuX6/Ooj+ZcEPt+58DJ40EnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4199.namprd12.prod.outlook.com (20.180.6.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Thu, 17 Oct 2019 17:56:49 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 17:56:49 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix compiler warnings for df perfmons
Thread-Topic: [PATCH] drm/amdgpu: fix compiler warnings for df perfmons
Thread-Index: AQHVhRQ/SuKRz7WQ10iBfoC6I7Zeug==
Date: Thu, 17 Oct 2019 17:56:49 +0000
Message-ID: <20191017175637.74270-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::44) To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7be0ec32-f957-4fc6-0619-08d7532b620d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4199E6C01AA3C3CDCA89C435856D0@CH2PR12MB4199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(199004)(189003)(7736002)(6916009)(486006)(25786009)(476003)(36756003)(66066001)(54906003)(3846002)(4744005)(2616005)(2906002)(1076003)(6436002)(6512007)(5640700003)(6116002)(99286004)(305945005)(52116002)(186003)(478600001)(14454004)(4326008)(256004)(102836004)(2351001)(386003)(66556008)(81166006)(66476007)(66446008)(64756008)(6506007)(6486002)(71200400001)(50226002)(71190400001)(8936002)(81156014)(66946007)(8676002)(316002)(26005)(5660300002)(2501003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4199;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: meZcqPJeMwrFAUwGswTP4peCO5nDzaIealDpm1SjAXaCXwyJ4AQwkyjW96RPub/Kf8GeoaDfFzF4on2kCt3mdj/2SpEFomsz8aP0tD7fZrFAVad8kL4P9wqhocKXP6MFFn6MVEpcK74Bpx0m21VRCt7/0Tp/Q+VViXuKctVJPednZMDFKYCwKjzlg3AAGNxryKiFBAmaH8xTLc64aC7SN4W6MQDTI2/JLd2RtAnXuTZyFCwi5beNEYd4kYqdPBr8SkEE5+U5mznGoGatiMsuEZBxBZbyqH0siZ/IoTlj2pTLcXLgh1vnYnPTxeLkotEZTNbEZ4FVKAC1rEPtsNf4jNecr5oxDOrtYjZEU8wn5eShDuC5TmzEZFE20F5ffaI24aJUKut5Lh2rMs1ZcqZibQRqTFWrbMLHR6RsbhN5uxs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be0ec32-f957-4fc6-0619-08d7532b620d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 17:56:49.2083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eZJXWDthj+s/DskiHkl81wlZoCWAt7Ef0FQbHapeFKPZsl/+TxhkMs+HdRO383de
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfWJs9dPOwwbQ/8ij4/0YVcs1R4D17loOIxQJInE4bs=;
 b=a8MsPuFaJE15q+96yhi9ER8cVR/1reVHUuwf2laT6G5woR2xhZFLd2Js5GnZlG+Qj4snXbprWK43TN5ayyHVqdgl7sNTTxz/7OlnK6S1/MVXZYn2fm1bsE01jKvBkKy0hF8RnLCen/w+TBEfzeg5qm3qmOO7VQBfvZDSh3GIR9Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zml4aW5nIGNvbXBpbGVyIHdhcm5pbmdzIGluIGRmIHYzLjYgZm9yIGMtc3RhdGUgdG9nZ2xlIGFu
ZCBwbWMgY291bnQuCgpDaGFuZ2UtSWQ6IEk3NGY4ZjFlYWZjY2Y1MjNhODlkNjBkMDA1ZTM1NDky
MzVmNzVjNmI4ClNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwppbmRleCBmNDAzYzYyYzk0NGUuLmUxY2Y3ZTljNjE2YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwpAQCAtOTMsNyArOTMsNyBAQCBjb25z
dCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICpkZl92M182X2F0dHJfZ3JvdXBzW10gPSB7CiAJCU5V
TEwKIH07CiAKLXN0YXRpYyBkZl92M182X3NldF9kZl9jc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIGludCBhbGxvdykKK3N0YXRpYyBpbnQgZGZfdjNfNl9zZXRfZGZfY3N0YXRlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgYWxsb3cpCiB7CiAJaW50IHIgPSAwOwogCkBA
IC01NDYsNyArNTQ2LDcgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9wbWNfZ2V0X2NvdW50KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCSAgdWludDY0X3QgY29uZmlnLAogCQkJCSAgdWlu
dDY0X3QgKmNvdW50KQogewotCXVpbnQzMl90IGxvX2Jhc2VfYWRkciwgaGlfYmFzZV9hZGRyLCBs
b192YWwsIGhpX3ZhbDsKKwl1aW50MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9f
dmFsID0gMCwgaGlfdmFsID0gMDsKIAkqY291bnQgPSAwOwogCiAJc3dpdGNoIChhZGV2LT5hc2lj
X3R5cGUpIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
