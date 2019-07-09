Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2CA62FCD
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 06:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC9889DFE;
	Tue,  9 Jul 2019 04:53:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820043.outbound.protection.outlook.com [40.107.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE0F89DFE
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 04:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHfOkGloqZvLpSkCflR8oqLMi0zx7v8gfbKeXuUI5Bzizbv7HG135JB0zvXc+f7jway13ZEYe/TKvZv+axymv6gOloMeOlsDJryXItAPOi12mRHX2otuyUsIhx+QjEoKemCuwzE+Lh8clcI6f9IWuZus2bBL0oeBSLnWit+pybXlK6AZ1kc8gfYsdUO2QnJspOlI0m3LgDJxoycCuzo6PMzUDXZYMmz3dwAYW+B0jhydOhMq9Igw5Vi3++jlbQYhdB7OuDfps5g4WW5DS5CVlbbeA6I6gPoKZnGS2ckhCBR2FHKJXvbsajoNyjCutDxwJVg42fHSmk6qv1bg5jVYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zCGOwJ8RGRnVNutvFYksqFS4WauQ/+AdOI16Y/oJjA=;
 b=e1QSzpbm4C3sBXPYOt99Trnm/5PiZIBmSMjP34PjK7+Sexm89wdulwSfqhumseGxdK5axmJ0Q/kE5nfPHuehJwVlzm6CkTuGl2WM11HI1yXok+6VQ37OHA4fOdZ5rseirjLH3fu+C6hPD484k0/bhdsp2591Jcb8+4v5O2Fm8E/dQxMQ7eubma4FC28xhK0IKZtGnphhr+70F6vYuzok1JKDm7VeG18NmJ73F6XP298H6sKcRi84V4UfsOL63Xmtbb0PLxNasOZzvLn1ClNkroQ0aN+R/eExrosjgy1JYlowJabGz8gDgQPcUaASo0n6Nt67ZxeperKgrROpHfsqDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4042.namprd12.prod.outlook.com (10.141.185.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 04:53:31 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 04:53:31 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Intermittent errors when using amdgpu_job_submit_direct
Thread-Topic: Intermittent errors when using amdgpu_job_submit_direct
Thread-Index: AQHVNhJBsDnJQXPLAkeGgQebgEnuIw==
Date: Tue, 9 Jul 2019 04:53:31 +0000
Message-ID: <885956af-be59-d218-f2e7-a0fc06042f21@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTBPR01CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::22) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfc790f4-85b1-4e8a-b48f-08d7042963e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4042; 
x-ms-traffictypediagnostic: DM6PR12MB4042:
x-microsoft-antispam-prvs: <DM6PR12MB40428BB9CBABEC222A37958B92F10@DM6PR12MB4042.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(189003)(199004)(478600001)(7736002)(386003)(6436002)(5660300002)(6506007)(4744005)(99286004)(2906002)(66066001)(65806001)(65956001)(52116002)(2351001)(65826007)(58126008)(2501003)(186003)(26005)(6486002)(256004)(8936002)(316002)(305945005)(102836004)(31686004)(6512007)(81166006)(81156014)(36756003)(486006)(25786009)(68736007)(31696002)(64126003)(6116002)(3846002)(86362001)(53936002)(8676002)(2616005)(476003)(66446008)(72206003)(73956011)(6916009)(5640700003)(66556008)(64756008)(66476007)(71200400001)(71190400001)(14454004)(66946007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4042;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UDM9Rgh3ePWq3Cw9XJKgu1ecJn+jnrZgmMOGPZDR61ZLP6dX1XxfihkbEZNMPZDoa0Fxs1jXhBMpW8uZtbumVNjKB+5jhVNn3NCLuo6dpjlQMM6TdTTR/QO2lRoiwW9QNkPam8AMVnYSBR+7eqfJGTD5ivw4OJ+50iX/BpZgqkBPyWccr3HKic4GdJjgt0YUdZvFKWoWCBxh/CDsXfTh6mn2NWvOiOUYhqPWZttt/k3yOP6E5thPfQi//tQlrbpgkNIBQcHsr5uP+kvKaAPUqFUiYnYw3J8sz2eEEBSU13EPORyzyEe3EQBwEYUSx96LqNEmmwqSUy5EKmV92tCfC2vqz/mfOlWd2PGw47q4SOsRpQXPPHYs/DDjLCQ0DZhFENf+G7JntRf31S6u+8fI0gB/Jh0XB2Igfg5Myv4Mn4k=
Content-ID: <2CD2D9FBD84D8E48A254B1A76C3BCDA8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc790f4-85b1-4e8a-b48f-08d7042963e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 04:53:31.4557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zCGOwJ8RGRnVNutvFYksqFS4WauQ/+AdOI16Y/oJjA=;
 b=vYG6aFdhylg5OUGZBt8xp/hfocO//sx9JwYlzpXNeq8TN2nmF71+jtPkbO28Cb840yhEQGROQeWA3i+TZ+N15WIIBkrgrDUBVNG2BcHV3CqY7DlgiqmYlBLuS02kODK+dd61Zp2BST3ViVhKBu69ITSMnLtdpTuBaqNZxiQbZKY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSdtIHNlZWluZyBzb21lIHdlaXJkIGludGVybWl0dGVudCBidWdzICh2bSBmYXVsdHMsIGhhbmdz
LCBldGMpIHdoZW4gDQp0cnlpbmcgdG8gdXNlIGFtZGdwdV9qb2Jfc3VibWl0X2RpcmVjdC4gSSdt
IHdvbmRlcmluZyBpZiB0aGVyZSBpcyBhIA0KcG9zc2liaWxpdHkgb2YgYSByYWNlIGNvbmRpdGlv
biwgd2hlbiBhIHN1Ym1pdF9kaXJlY3QgYW5kIGEgR1BVIA0Kc2NoZWR1bGVyIHRocmVhZCB0cnkg
dG8gc3VibWl0IHRvIHRoZSBzYW1lIHJpbmcgYXQgdGhlIHNhbWUgdGltZS4gSSANCmRpZG4ndCBz
ZWUgYW55IGxvY2tpbmcgdG8gYWxsb3cgbXVsdGlwbGUgdGhyZWFkcyBzYWZlbHkgc3VibWl0dGlu
ZyB0byANCnRoZSBzYW1lIHJpbmcuDQoNCkFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNClRoYW5r
cywNCiDCoCBGZWxpeA0KDQotLSANCkYgZSBsIGkgeCAgIEsgdSBlIGggbCBpIG4gZw0KUE1UUyBT
b2Z0d2FyZSBEZXZlbG9wbWVudCBFbmdpbmVlciB8IExpbnV4IENvbXB1dGUgS2VybmVsDQoxIENv
bW1lcmNlIFZhbGxleSBEci4gRWFzdCwgTWFya2hhbSwgT04gTDNUIDdYNiBDYW5hZGENCihPKSAr
MSgyODkpNjk1LTE1OTcNCiAgICBfICAgICBfICAgXyAgIF9fX19fICAgX19fX18NCiAgIC8gXCAg
IHwgXCAvIHwgfCAgXyAgXCAgXCBfICB8DQogIC8gQSBcICB8IFxNLyB8IHwgfEQpICkgIC98X3wg
fA0KL18vIFxfXCB8X3wgfF98IHxfX19fXy8gfF9fLyBcfCAgIGZhY2Vib29rLmNvbS9BTUQgfCBh
bWQuY29tDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
