Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B78AE346
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 07:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650EE89F31;
	Tue, 10 Sep 2019 05:42:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B24A89F31
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 05:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwPbQGd6W0sLw3sUrSt/Ay+qBgq2TValK6btGH1Br6C8D/ar49nkWgMb7XxxKe1QJXEMcTrDXnzPdWH5jKe55t5LJK7yAEIylufju9/vV4vYttpkxR1P73zT0k2ArYRznE6+w+nNTsDiJ43Brb7RrqQr0DIega1I2DS4prOHLrCw9ygDjkBibnEDMbpeOctgwp9peZjl3TSXEuz4JwinxlYsMW+CsBa1RsOMuI/7IwR/Yce5nChqr/rfXUWiAxoWxrfWTqm9jNEr/ioiX91WH6ZJLDq1iADyd27KfOPG8q//VMqtW2V0JKYL5D/+PaeEi+waaoXZnz+3/quoXlU/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jluShOLKuGM2U4RaxXYGZiGgEPwAICXppeRyBj1uA8o=;
 b=L7vwvM36qvGfFY175POD/mqh/eabg2g4j/Wdd9VjiJ5drsMOsRuCG1czkKoEO56ogxaoJhtJEiRJOpf7wDmA5gWyE05aMIJhx3pC/kvxpa/CfxP6fPGz9hDPhrMoY0J0zJGwTuKrOWXt3nebxZ9Nr/rOPgGgzg9vS3qDPXh26cbgEkwUnd3Q4jjEi7WKpFA6N8snh56WMaLd0MmFfGY7GVFBZxh22isaBUEv2Qgy5gtx76keWsQ8Onj48TRdrl3/WI9jyaBjwccbHO76xa2HvTAws5oB6x1LfP8g+wCfgRpWsGEZ8Pkoz+zKVqSuiV0anNFQfs53TmykYEMZ8OWufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB2501.namprd12.prod.outlook.com (52.132.141.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 05:42:37 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.005; Tue, 10 Sep 2019
 05:42:37 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Recall: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Topic: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Index: AQHVZ5qNsrurfLDZ2kKddJiBgsIIPw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 17
X-FaxNumberOfPages: 0
Date: Tue, 10 Sep 2019 05:42:37 +0000
Message-ID: <DM5PR12MB2535837A43082C3405A92B1F95B60@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81cd1c12-4261-4090-db98-08d735b1b023
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2501; 
x-ms-traffictypediagnostic: DM5PR12MB2501:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB250127B21910AA8A9D51B2FE95B60@DM5PR12MB2501.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(102836004)(52536014)(2501003)(71200400001)(316002)(2351001)(486006)(476003)(99286004)(558084003)(54906003)(7696005)(76116006)(33656002)(5660300002)(6916009)(55016002)(26005)(6436002)(256004)(53936002)(5640700003)(305945005)(9686003)(81156014)(186003)(71190400001)(66066001)(14454004)(6506007)(8676002)(478600001)(8936002)(74316002)(2906002)(66556008)(66476007)(3846002)(64756008)(66946007)(4326008)(25786009)(66446008)(86362001)(7736002)(6116002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2501;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /NbXnJQ2aRUeE0mdBSYEomMTQQ+BrJ0z69/67/PRbsj5XcgQzCBp1KeFOjLdHlQDZ9+FAXKcE/K/ukj65ynQQ4fF81nF2rV40++fJlQ7fPeyOYll8vyRobm/65wKJHcmwxyUfZzUBo/r40g/tC0POhs0n8dL7K3bW2RoA8aFtyZStx7MilAHgn5EaUfZ9ACyV/cWhrSb9lUjTaMbyiT1YBnqvcMsVwVBBDtPfxo8WcacDGb5Z5QUVyuB3erZPo7ISN4ENCeBYGboSL8PRR72F2x59jgKKBYFQFG7eBOz3ZUR/kxf+nfTbNePAFPk98+lv3CcVZAOYhbd6QJttaYxjVCK3KljEKMUqf4AHRYp6QqdbPtj6l8SxEm+rTVnVwaL9ICJkQGcNBE/XFWNiSFATQWyO3wLBBIK5IwoO2WjINc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cd1c12-4261-4090-db98-08d735b1b023
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 05:42:37.6018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FyCTBvyywWFTtlEvV5dY2XjbDhh+y3OiKHfrIS6r0g2Qguv2AAFDzMcyRIo9z4VImTfm9zoBv30AQnLfaNufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jluShOLKuGM2U4RaxXYGZiGgEPwAICXppeRyBj1uA8o=;
 b=w/7lC2LYkVwS2SGdAqz8pwNw/LfyeO9tgv+x/K24Z+J8EpsFenlQ9at42U4vslAOl1hXDXOQbfGHS/VocmV4P16KXp3kYZ+4u6eMDUdq9287a3iNCP884Q9tnlHkRhmkHEl4SFAB+tFwn30xDwjgpU6xUpbA1oyFaHf66L033c4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Xu,
 Feifei" <Feifei.Xu@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Long,
 Gang" <Gang.Long@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

WWluLCBUaWFuY2kgKFJpY28pIHdvdWxkIGxpa2UgdG8gcmVjYWxsIHRoZSBtZXNzYWdlLCAiW1Bh
dGNoXSBkcm0vYW1kZ3B1OiBhZGQgbmF2aTE0IFBDSSBJRCBmb3IgV0tTIFNLVSBQcm8tWExNIi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
