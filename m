Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409ACED90
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 22:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BF86E17C;
	Mon,  7 Oct 2019 20:34:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750072.outbound.protection.outlook.com [40.107.75.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6506D6E17C
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 20:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJP7BL3/pzhi5X6DobAY+wPaJiuojLRNSW2Hjh83JV8ePkM858q+5kpw3aWus5nJtEUuA6zpqkFo3h/ct1Y1KCz6gW9XH4+GsW33ciNZmht5yXgejCOmWyDl97NYGf/76V4Q60HN1/koh023hM1siMnQ3kcnOuqW7EXS/7GklaeEi0bJrNZ4vXtX1+rkjMVKE+saS6A/oZFeTji936k06ByfXc780aGYDRrfvU3tjnQWbZeQZay5J8aalE321PUsWu6OENhIMuLTfpaqzKBRfFww9a2Iwq0CEpSko0ImZiiJd7/O9rGCv0BhJlVV6fCR7Phz01gSbB0QuIDpWpZMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Avvvytj2A4tqD8yzZKirK4TsbO6w4xScqOM1hpuW0cc=;
 b=CWigteJfMaM3/ml+1q21v/rqdA83pkme714amSXTlYQUBMKz+LdSTlk72GjfFyp1sWYGfSTprlJ6g62fVW/wI2IpYGUuPyMDU6U0X2lBJkv3w/3iYevqKvICw+QqnJx4Kmyig6kmpuqVpUKJliwP267v+QTQpztLIJTjGaVV5j0nh8IgXr4H9qHAil7KReF9Kv1RUExgn6IVW17smpqDLrhz/x8vA6KLtLFoNoVP0LmdFNPABBvwVTEQeEzYYbujcFvurhbZuQydtLgTHDuoprXSUdFi2YL5qUKMSmhYTk/TD7HX3URtO/VxBC0tUtdOKIwl/EuDWFu3//+6bJWChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2515.namprd12.prod.outlook.com (52.132.28.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 20:34:17 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 20:34:17 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Topic: [PATCH 2/2] drm/amdgpu: Enable gfx cache probing on HDP write
 for arcturus
Thread-Index: AQHVfU6Xk4ylnGix+EK2EMGioBnwyA==
Date: Mon, 7 Oct 2019 20:34:17 +0000
Message-ID: <1570480448-29861-2-git-send-email-Oak.Zeng@amd.com>
References: <1570480448-29861-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1570480448-29861-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9072f6d7-9429-4e21-4f33-08d74b65b9af
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR12MB2515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2515D52B9257FD39B2C94463809B0@BL0PR12MB2515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(189003)(199004)(102836004)(6486002)(54906003)(386003)(2501003)(71190400001)(2616005)(4326008)(4744005)(71200400001)(6506007)(5660300002)(256004)(6916009)(14454004)(8936002)(5640700003)(305945005)(186003)(11346002)(6116002)(446003)(2906002)(50226002)(14444005)(26005)(3846002)(478600001)(6512007)(486006)(476003)(6436002)(66066001)(36756003)(316002)(66946007)(86362001)(2351001)(25786009)(52116002)(99286004)(8676002)(64756008)(66556008)(66446008)(7736002)(81166006)(76176011)(81156014)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2515;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ot+Y+7nyEegK8Dt/gJxKS6yN16dqd+mt2ib9HyniJ46Lk5KNWT+eppcVst937Po+ptn7Xsob8fwgHaZzAUKAmRE7lypTroYXAyJNukVgpOkZBwxdAcK01rraDlPCXlUJuqgZZsTbPOx/znGYrRj8b6J13L7Yndt1asHqSR/c4oXI4pM/u3jbuUZQ+y9Hc3mkVHx7846EY82UX41bIYMbGPCHZ2LDv8s8jJdACt+5dWaF9Aba1bBaGmWyswyuueijxIrzOuKV6E4NJOTFttTW1Irbp0zywm0/PFKraMbZFPF/e894giKUh4LKO/ym8Rdwl10J2X1I1meIWD+fuy2emOzC3nLT4Umm7Z/fiYfSSHrhKwyUWCk5foCwjhGgLRUs4BuJSSkHvAB1pCo6REYn3rSTSgTypLUKjrCil4EObIk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9072f6d7-9429-4e21-4f33-08d74b65b9af
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 20:34:17.7657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vfu2d8cD9btzEdRmMe64i0fXfvXNp1HHDD6ro05X+vrA4N7hC0Z4NDxiDb1Oosd+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Avvvytj2A4tqD8yzZKirK4TsbO6w4xScqOM1hpuW0cc=;
 b=4BLVPMVJ03IViXkYCZ1G9RV6CxEMK2iOX3dRWpGsKCt6brO97SL29UKrsIBY2N8+1l7j+BoRmj/l6XSUQTEiGGDOvbIhNE/Itf3xOCKAnXzSSUwpb3zMqGS4Up7LL0NIpf4PAnctxohv6XHjzIcfI4kPA6u7VovLB1TrhgO2eLo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgZ2Z4IGNhY2hlIHRvIGJlIHByb2JlZCBhbmQgaW52YWxpZGF0ZWQgKGZvciBu
b25lLWRpcnR5IGNhY2hlIGxpbmVzKQpvbiBhIEhEUCB3cml0ZSAoZnJvbSBlaXRoZXIgYW5vdGhl
ciBHUFUgb3IgQ1BVKS4gVGhpcyBzaG91bGQgd29yayBvbmx5IGZvciB0aGUKbWVtb3J5IG1hcHBl
ZCBhcyBSVyBtZW1vcnkgdHlwZSBuZXdseSBhZGRlZCBmb3IgYXJjdHVydXMsIHRvIGFjaGlldmUg
c29tZSBjYWNoZQpjb2hlcmVuY2UgYi90IG11bHRpcGxlIG1lbW9yeSBjbGllbnRzLgoKQ2hhbmdl
LUlkOiBJNWM5YTZhMjVkODhjZDc1YzcxYzg4ODIyMTIzZTBkNGMwNjdhYTNmOApTaWduZWQtb2Zm
LWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBjN2UwN2YxLi42ZTQ1
ZWJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTExOTIsNiArMTE5
Miw5IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJCS8qIFRP
RE8gZm9yIHJlbm9pciAqLwogCQltbWh1Yl92MV8wX3VwZGF0ZV9wb3dlcl9nYXRpbmcoYWRldiwg
dHJ1ZSk7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9BUkNUVVJVUzoKKwkJV1JFRzMyX0ZJRUxEMTUo
SERQLCAwLCBIRFBfTU1IVUJfQ05UTCwgSERQX01NSFVCX0dDQywgMSk7CisJCWJyZWFrOwogCWRl
ZmF1bHQ6CiAJCWJyZWFrOwogCX0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
