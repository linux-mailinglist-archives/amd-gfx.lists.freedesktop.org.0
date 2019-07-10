Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011D164979
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 17:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C506E0FF;
	Wed, 10 Jul 2019 15:23:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800077.outbound.protection.outlook.com [40.107.80.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9B46E0FF
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 15:23:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBgmtBEWjqPeBVjShAu9NrWt/RKF7SDPuxRNCq42q0gGz6Y7p1Pgyi8TptaIEq8qnTjLu+VKON2XWF/2RP8NIFSONHufXKmjT9id6dqIZ1QSqd8pltxpQvCGm+O+lTUkwbpf0JSYEgq7MM3KJ86lHR9I61Z8mcRMt4Pf0TWPdIIz0BmRflGt++NdctKXuatAEo4WOXjEqq+qDcZRKTQTiNTk+34eFp5I4U/J4uXeI4n+XFFOCqNEmOlAOhodtZDxYxqC1e7ezoUeqZIkQU/4chtTqcstSXfpycJw7xYMmjmwNShi8/w04DsRrLGQLX8uPkuQIAJAW01m7wqKTlag6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgkkhYkapeNmju0cK0h/lG+eajhrNnymhsjW7cVk330=;
 b=fpXCjmgKRWN2G/3/5D++D6I/Ga4SoChqWSMkSGRH0mU9m1oLFn/Nw8qSqqn3I1bb/4fD+Z37ZdTinWLADWEDESngpfcQHe/uvN4q1Q1IH0lphgkNVtY2rgFTbCHaLUTfRsd25i9kewjwa8pl1X3ITO8+CBWQF+P3NR3vbJ3OrDgVUnOtVSJKoh+k3xHQuwy721crEvVCdi9PgAle1/jDLmMgSify/l/Z4g3qDUYxGFiHshDwDOu6wL9LeHCrYz+4TAYE0g8FdOopirGqIGCsEhGHXzZo7uERVIk9boUmHoZmTC+IX8lvEDnnZtEvIbhJ0fCnROiSb8Uxx/7Ov/wOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (52.132.141.147) by
 DM5PR12MB1849.namprd12.prod.outlook.com (10.175.85.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 15:23:56 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d%4]) with mapi id 15.20.2073.008; Wed, 10 Jul 2019
 15:23:56 +0000
From: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Recall: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Topic: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Index: AQHVNzN8r5aEa8NGwUyqp0Rm2tGxMw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Wed, 10 Jul 2019 15:23:56 +0000
Message-ID: <DM5PR12MB2504C2152C03299213EBD6F182F00@DM5PR12MB2504.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d79f6a49-e92f-4b67-8ef4-08d7054a9fdc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1849; 
x-ms-traffictypediagnostic: DM5PR12MB1849:
x-microsoft-antispam-prvs: <DM5PR12MB184962B68AE48170DBCA1D1C82F00@DM5PR12MB1849.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(99286004)(71200400001)(86362001)(558084003)(7696005)(33656002)(6506007)(66066001)(74316002)(2351001)(2501003)(7736002)(2906002)(6436002)(71190400001)(26005)(14454004)(102836004)(305945005)(186003)(68736007)(66446008)(4326008)(476003)(55016002)(66946007)(486006)(6916009)(76116006)(66476007)(66556008)(5660300002)(25786009)(81166006)(81156014)(5640700003)(9686003)(64756008)(52536014)(256004)(8936002)(3846002)(6116002)(478600001)(54906003)(316002)(53936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1849;
 H:DM5PR12MB2504.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WtC62IcxyaxwYSBtITtb7EiA8iidvKSxC7oWO5wgfJetmyPOW5nNNBXlVcrF1nJN0EJhaTrAtLlAuJPZYMwx1eAAkvcrvsMdtX8sZ2YGVpMTP3WznvyYmXuYbE1XnDUowr+ZSpydDCtzukmE13Dt/jJIlKzN2DNoOVpYvYKn2VafBS69vahs6NGN7IGnqdo4Gg9j6JKrkeQTEALz1Qu0UclGlMiosL7AWIRGC87wMhz+hv4um74qotW17c5e4ZzRISr/EUieiX9N2il5dPNfl0oUQleSda9CQ2n+AMsA4F6hKk+ti3NSaAs/B3UmmPf94c9I4+RFW3d6/oCXkJOUvC6AQCrV6oybgTgf0/8k0pYnFQrBO0KXzT26wXkJfQOZlKfMMl8qd48FNLtK7lkJ9Y6k+5Z3XDF/cXGO004MNnY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79f6a49-e92f-4b67-8ef4-08d7054a9fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 15:23:56.2036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jinhuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgkkhYkapeNmju0cK0h/lG+eajhrNnymhsjW7cVk330=;
 b=vqvbHwMw/DArwEKt6Jtxxh+jQoKELE3nn5MvryG27S8QCxQfaZPIkbr+GxAQQULssWssl4CB9SDlDRUMQ4hRoUt3qL/x3dd62DbNq7rGFUzV4MFvFqa+871Vjkcx/lSJoAPZ/LLFE2Z2/qRZM+8V8oLpG3wfQYQo2FRibIZYFU0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JinHuiEric.Huang@amd.com; 
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
Cc: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SHVhbmcsIEppbkh1aUVyaWMgd291bGQgbGlrZSB0byByZWNhbGwgdGhlIG1lc3NhZ2UsICJbUEFU
Q0hdIGRybS9hbWRrZmQ6IGZpeCBjcCBoYW5nIGluIGV2aWN0aW9uIi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
