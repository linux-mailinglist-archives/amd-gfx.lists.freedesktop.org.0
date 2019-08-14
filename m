Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A58DBF1
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 19:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0546E79C;
	Wed, 14 Aug 2019 17:33:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770084.outbound.protection.outlook.com [40.107.77.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F26E79C
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 17:33:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGlW4pFgqxWeTHRVf7MsHnZzbDIzKCbsyTYAj+f8PeZdUvBJd2qzIKoT67rid0XFYYrY9gR+98+d9es/afbqFWy/bnBLpWD7KqoM3jZfs2J+HhfyxhqPr7fkekAKLC2IWoeN6zx108rATFQz4TrbxEZ43ZK7dDpqS8i3kt+l1YU239q38dgIVeExzDLd2bPnzHu9F+lRQZhK8m84ozoZObZFmgASAeGbYRcq8wr3ZXr9oEdUevRBrczcu3u10sBfk1w7Jh8d55jVKj9ipe9X42Q/5XRWgytyjb14zZc83uTTAkf76n4ZKIdzARiVbF1Ya4Fl9ij7kWbK5AuO9T9nKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y61x8dIgV31CXnGYp/Ni3nNbqXiNYSN0KAlAA87LIo=;
 b=Jx4EB1f1QOxuU+sBmxcBa2eYS/UwGMR/jjPWJ1TjAYdYjCQpKcn8tSdBPhVuqGOsIaJ8nNKjXX7sQi4dXhIIDa7Z3YqCSyTUzOxKIm8LTNgrMtpE86ceNcja82t5UbL/d3cN6k7ZVfJKCGQ/Rh08q826P3qMy5Bz5+8Xm1mo/GLg6gywYio3wX4Po/qTXyXTNHHfkdztAwEf4LnTUpY+X7tMjwCsa0BZC1ijMukyH5gXcwyDhH/qVuI9nhzod1/8JBNxNBWt5TaFbn5eacCQk/6BuRKclctjz5hPjWuLYwt+b4mjLy6MB/dFc4NxsV3yKxpq5vmKEsK84J2kiozXPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1698.namprd12.prod.outlook.com (10.175.101.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Wed, 14 Aug 2019 17:33:48 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 17:33:48 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Update VM function pointer   When VM state
 changed and system in large bar mode, make sure to use CPU update function, 
 otherwise use   SDMA function.
Thread-Topic: [PATCH] drm/amd/amdgpu: Update VM function pointer   When VM
 state changed and system in large bar mode,   make sure to use CPU update
 function, otherwise use   SDMA function.
Thread-Index: AQHVUsZu/ffyYQZNUkuHkL/W3v9QOA==
Date: Wed, 14 Aug 2019 17:33:48 +0000
Message-ID: <1565804013-20946-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91e8d87f-4408-4550-38e2-08d720dd907a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1698; 
x-ms-traffictypediagnostic: BN6PR12MB1698:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1698444772E37B39D9DB8610FFAD0@BN6PR12MB1698.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(189003)(199004)(4326008)(256004)(52116002)(7736002)(4744005)(6486002)(14454004)(14444005)(8676002)(2501003)(305945005)(5660300002)(6916009)(71190400001)(71200400001)(2906002)(6436002)(6116002)(316002)(5640700003)(3846002)(66946007)(53936002)(6506007)(2351001)(15650500001)(50226002)(476003)(64756008)(8936002)(486006)(66556008)(36756003)(186003)(81166006)(66066001)(2616005)(26005)(99286004)(66476007)(81156014)(102836004)(25786009)(386003)(6512007)(478600001)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1698;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a+1AOVAvCNwcFMf+RYRnkymC38IWtOsGmEp98ZhyLlmWOKIcdE20tFkOJo7Jyvhnv1rrlpPKpI9/jTOWrPyUMrREiYSN1GSg9nkvabk/YUip8uT1x94rd0zJsOKJlzglKjWdysCa8nzys0fWfNHn3WtB8piRB9GVu+Ngd+s9akNf7fmbR6E52qrDL65owotTvPSa7DQOOJWSCWowktvZct8+35s4tDty+aJGIyJsOksbL4WEBcOyMrU1C8GbFa9l2FmZrTU8P7AzuEqfh92SRRSAEYBgHGDGB5komAFgWwwsvLKUFgkIyX7wpTICSPSucvu5Q/m4Eheh04tjY9RgjIAuNpOfJ+uvWEIusMqANeJp+r6PFKD/yvqQZbuf4iSGp3RN3O0Qzg5wQjbgSwUHP/wfxCDQKELaj8dd3gelyEM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e8d87f-4408-4550-38e2-08d720dd907a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 17:33:48.2093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8ANdtPgGZAPSw2kAg9nnzmhMeKa2t5BEU7pYPlozvkHNDyAXZy90I0f85lYkYPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y61x8dIgV31CXnGYp/Ni3nNbqXiNYSN0KAlAA87LIo=;
 b=lArgcYicsbZX906TxhLcG6fWEflSalxQWQ3X5HhKG7jTPzIrTmrPOiF7FI1vc642JG5zWB1jZfltdFalrrOsAX0Oo+vC2dCFaVQdW3Iz32kBDzvp1yVGwD2dS5MM4L+EIarHj/sdGLJ/VmCkAUnaZGt9xdVSxdoXIArAfNs3oL4=
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

Q2hhbmdlLUlkOiBJYmNmYWRhNTYwYTAwYzlhZWViZmQ5MjJhZTQ4ZGU5MjBlNDRhNTg2NgpTaWdu
ZWQtb2ZmLWJ5OiBHYW5nIEJhIDxnYWJhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IGMxYmFm
M2QuLjdkZGNhM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0y
ODYyLDYgKzI4NjIsMTMgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLCB1bnMKIAlXQVJOX09OQ0UoKHZt
LT51c2VfY3B1X2Zvcl91cGRhdGUgJiYgIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUoJmFk
ZXYtPmdtYykpLAogCQkgICJDUFUgdXBkYXRlIG9mIFZNIHJlY29tbWVuZGVkIG9ubHkgZm9yIGxh
cmdlIEJBUiBzeXN0ZW1cbiIpOwogCisJaWYgKHZtLT51c2VfY3B1X2Zvcl91cGRhdGUpCisJCXZt
LT51cGRhdGVfZnVuY3MgPSAmYW1kZ3B1X3ZtX2NwdV9mdW5jczsKKwllbHNlCisJCXZtLT51cGRh
dGVfZnVuY3MgPSAmYW1kZ3B1X3ZtX3NkbWFfZnVuY3M7CisJZG1hX2ZlbmNlX3B1dCh2bS0+bGFz
dF91cGRhdGUpOworCXZtLT5sYXN0X3VwZGF0ZSA9IE5VTEw7CisKIAlpZiAodm0tPnBhc2lkKSB7
CiAJCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
