Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C5AE368
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 08:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116B889B0C;
	Tue, 10 Sep 2019 06:02:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690050.outbound.protection.outlook.com [40.107.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022A489B0C
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 06:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRh7tRLd8SniUz8P6cPnqKYg7SHvwpDWWqYOkVhHWEJKgL9WX29hoc6VF7BfZtdgBNsJSnqtaYduru2YA+HMgs3diL6K4br4RXLztpvduCCCaXYN5kB8qROytkaXZwXBTN0iNZvGeKTpTMz6HQWhFso2LzSSwIomeLBa5pjBFPRg0iRUXiDP//Xm0s8How18/YhhB85YIzCR6ht/zWHoCHVe1YaA2oEP5XUqaDaNglArl0yV7QoomHzLD+BssnTzOXO7mzkIQugindX8oJtjhOoSBcxxhGOdjcohqmuo5yAN3FHyv4ItvSJi6xHjU/U2k8eQPOQngsLxGuamgwVDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jluShOLKuGM2U4RaxXYGZiGgEPwAICXppeRyBj1uA8o=;
 b=oCNYfzPkDGgWswqgTBJdJbRpZXUVdZQMWZWnycSk0uIsHtuZuv6C+GrZpsMc5wRAoFDdAlUlRpd0tIgHjN4In4PwtF9s7+zNWl4tZ6CsvTa7tbSE2Q50voGcpIUXQDRKMwTyk7DF+IbrfFyi1fiOBuL5EqhcLYHGwyl/A82CeQLwAUPWWW/eyl6GtYWLLPmxrVYzE8Fu7IGtaCaPnxx8SSrDdk/rvcdXZx8e0/98QYys3+m1jzoVzcZgPf3TcDYX/XdD1FD7ki9bxM6dfLKzQFcpoC0ov95AKLxv08WPMF2TmaWL57jbEf8VY6j8UxQIaxd2ulky1VHh8MAqUhGHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 06:02:54 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.005; Tue, 10 Sep 2019
 06:02:54 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Recall: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Topic: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Index: AQHVZ51iNgsA5vY3PEeqE8fxouWslQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 17
X-FaxNumberOfPages: 0
Date: Tue, 10 Sep 2019 06:02:54 +0000
Message-ID: <DM5PR12MB253592332BD5FCBC5177F22395B60@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 780dbf1c-8ead-41e0-2480-08d735b48565
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1705; 
x-ms-traffictypediagnostic: DM5PR12MB1705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB170520010FF26D6546D5340F95B60@DM5PR12MB1705.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(199004)(189003)(53936002)(25786009)(6916009)(8676002)(476003)(486006)(33656002)(6436002)(102836004)(54906003)(316002)(6116002)(3846002)(478600001)(186003)(2351001)(5660300002)(7696005)(4326008)(2906002)(8936002)(81156014)(6506007)(99286004)(81166006)(26005)(14454004)(66066001)(76116006)(305945005)(66946007)(55016002)(9686003)(52536014)(71190400001)(71200400001)(74316002)(5640700003)(66476007)(7736002)(64756008)(66446008)(66556008)(86362001)(558084003)(256004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1705;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WlOocBAVi5fTm/9oNDluNI0FvI3sEDLtUI6vVQS0/fS8MJfHE1Do5LHwA3+/CaG83miSKEvf/joanu130iZ5dr+SNG4K8//dOJk58W0er2cPUtflEb0ZvB3NapyM/rSqSFlB2ZW88aYRfEWpqCBLEBcN4Xm0ePBcV3fWNEJiujyLtThjP/u556QZubNaH0heavUV9f+R88LPLhOA1235c2OojakyjiP9l9vBBXzVGb1BZE/spS1wK/OwCBUx0gK43rCQOJ9NMaK7t+/iQMOTFo3jTDm8EpguvzBTewb6aLb6gHr9WFo4wXF82J5TSjnfo1kuj9PjDh9/4zYEt8A8r4AJ6lHdWc8Gw6dXQD11O6iR+rDt9XNSdrxzVdy9SnThIKwyqKxYncJfvGZqglp9Y4qxExBPL2Q65v6DHofuG+Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780dbf1c-8ead-41e0-2480-08d735b48565
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 06:02:54.3638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rn/DyO83ca52gngWh3spSPwwxh7KpxfmdtYnlnbcI1Yq7OFg6HTue4x7rxNZ/6vsImgZgwCT/hoH+hgbiPry4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jluShOLKuGM2U4RaxXYGZiGgEPwAICXppeRyBj1uA8o=;
 b=KVWMx8bkJmhJfuE5CnMkDIFzaCkCkv7rFGHDGv1d7I90WytxJ3fnG46Rp6F53utAHvm/YKbaoL6PoeTeytz8ls3tDMEu6+ciGq+wSA88au8QM9FrBxdEnmhc+eMGW/kQOGzmd4Vdfq/7bJ6UYcPlar8uZCokSv9Vq50fgEtacNY=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Long,
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
