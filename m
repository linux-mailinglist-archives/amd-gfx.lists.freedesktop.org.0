Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32294A862E
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5C89BFF;
	Wed,  4 Sep 2019 15:48:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810044.outbound.protection.outlook.com [40.107.81.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB64589BFB
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4Oc3I3suI6Tb2OH9cxhDXaInXRAtRome3Ez97NzBK8qGF1mlPAKeyGVoA5fPZUKhpofpS4BZjcR01pI+A0HyN+Xu8e3mnLsSNaX6qrMLsn/6p+Um8sJSXI7feTa6htFUhoq5mb0e6PMA2sd/ZDgRrb7uBa5SaU9LK1/a9/oYo0LUt/l6Em/UbX7koDS19B3e0AceSBEIMb0wuOLt9yL0nqtdEapWyg3eP946Rrrm9jlj7H9KNDjGXkds2HNlTOASg17HYvM/dkGdqfV8aPCK5tj6veuA3OzvaW9gH1Yh8G+HOZ39r/L/f92snRkUYeLysVaXw7HDU1LDVxaOBVmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa4069m77LoTcCkJH/yV8vTBxoSh+3xPpDXOkP6AZpM=;
 b=Wzfy7ErqrC4IL7BzENvr5JhTkXDUjR7AzsMitXrOFQoipCaBSYmtfhchF0iubGen7/2KoS/pOUOrLeOKhxL5fGNFFpmUJsRX86OzkTYayZtOIWNboNtZhrOONAi+pCPeFPT61/XPsxA/oWdBcyRBssv/xt3/GI6HXfMBvzjVTPEEU9TbVQhe54juPwxpG6cRAS+YILeP/lg3JOs2Do65ZZ0b/gC+WAaRnu7dzV2w8bkgQHBqDIYZrQQAb5A2lLvHENt5gCj2jrsS13354YTWC82sqd4z886dAM4S9fgWcrLeJp8fyoyo+LrA3pUaYkQo7uiuz04tsJjZMMU1lrjqqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:31 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:31 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/10] drm/amdkfd: add renoir kfd topology
Thread-Topic: [PATCH 08/10] drm/amdkfd: add renoir kfd topology
Thread-Index: AQHVYzgzso893Lues0e2PXaEPMlURQ==
Date: Wed, 4 Sep 2019 15:48:31 +0000
Message-ID: <20190904154803.5102-9-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa82fded-479c-4430-d656-08d7314f560c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2863072456D3EFE5FA9508E0ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(4744005)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BVJGTzLfnjoB9ZkPlv2kTM12zfcnJIkc12OcSwfpBp8f0Nt8GSOmfwQeCG9t6Xh7MRG5+t4HBpLoYEjRNq0mRrLeVqzwFD+1w2FMqsvWd9y95RmIiXHvpw4UaZ2fFkVfuawbF/G2uzI9y4dyG2dz6h9dwbZp18DSY14ba/5dEcOR3gKI4eV6UeoHIFg9n36ICoLNvFSD/2YdgVirXsZR2XNa0l4c1ZBI+1IGGiPz8sI/8ZjLBTTtj7HE/KEJOWJtkm/Mg0zWQMLhurBLInv9NzTXM1JfSiOeeIIwBw3V9y1l3l48+RpEbLISkgUoYB+GBgXoLbyhbfAJQRskxS2uzhZGkaphcf23yBVcUjVpV17Hg86IXeivFFr0VJVuP7X93LBAadEjwWTbTAVOj3IJISSvbgV8JCmIpHnEWBgppG8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa82fded-479c-4430-d656-08d7314f560c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:31.5032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFmSr79RjWLMBYdBivUtRGlnO5NcU9lqILmbWQc5LRijAywjxAo3LyijGXz6Dj8i68f7TU3Cb27OQ15PzVfVtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa4069m77LoTcCkJH/yV8vTBxoSh+3xPpDXOkP6AZpM=;
 b=r3LKyvtjXwS3lF+8tTh98xUp7zg7GOSFvKXchVehCJpmn5ti7OKBh18cPJ1ftSIZ2GKrsru9Ex/fB6hQNo/t0X5wZHcxBVpKmmD0zyAvlP2nY3HM6TzsSUJQQtZWsC8RG0991/5BgoFJ6qcyTJXqe/qFrEekSRRk5wXnvvp+ouQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHJlbm9pciBrZmQgdG9wb2xvZ3kgd2hpY2ggaXMgdGhlIHNhbWUgd2l0
aCBSYXZlbi4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3RvcG9sb2d5LmMKaW5kZXggNDNmZTkyMC4uZDUyZjkzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMKQEAgLTE0MTcsNiArMTQxNyw3IEBAIGludCBrZmRfdG9w
b2xvZ3lfYWRkX2RldmljZShzdHJ1Y3Qga2ZkX2RldiAqZ3B1KQogCWNhc2UgQ0hJUF9WRUdBMTI6
CiAJY2FzZSBDSElQX1ZFR0EyMDoKIAljYXNlIENISVBfUkFWRU46CisJY2FzZSBDSElQX1JFTk9J
UjoKIAljYXNlIENISVBfTkFWSTEwOgogCQlkZXYtPm5vZGVfcHJvcHMuY2FwYWJpbGl0eSB8PSAo
KEhTQV9DQVBfRE9PUkJFTExfVFlQRV8yXzAgPDwKIAkJCUhTQV9DQVBfRE9PUkJFTExfVFlQRV9U
T1RBTEJJVFNfU0hJRlQpICYKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
