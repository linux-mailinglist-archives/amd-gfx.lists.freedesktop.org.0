Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86761ABD2
	for <lists+amd-gfx@lfdr.de>; Sun, 12 May 2019 12:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400B8999A;
	Sun, 12 May 2019 10:37:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20318999A
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 May 2019 10:37:24 +0000 (UTC)
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (20.178.199.89) by
 DM6PR12MB2777.namprd12.prod.outlook.com (20.176.114.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Sun, 12 May 2019 10:37:21 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::ac12:e2c5:1484:530a]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::ac12:e2c5:1484:530a%6]) with mapi id 15.20.1878.022; Sun, 12 May 2019
 10:37:21 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix -Wswitch warning due to missing of
 default case
Thread-Topic: [PATCH] drm/amdgpu: fix -Wswitch warning due to missing of
 default case
Thread-Index: AQHVCK6t9OeqT/1W+USJIOLn5eTcWg==
Date: Sun, 12 May 2019 10:37:20 +0000
Message-ID: <DM6PR12MB3627832DE2D94147A5EF2946890E0@DM6PR12MB3627.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.84.177.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed7be8f4-a28c-47f1-8359-08d6d6c5d064
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2777; 
x-ms-traffictypediagnostic: DM6PR12MB2777:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB2777181A2086D929E3714B91890E0@DM6PR12MB2777.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:163;
x-forefront-prvs: 0035B15214
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(366004)(346002)(39860400002)(189003)(199004)(66946007)(478600001)(86362001)(99286004)(966005)(229853002)(72206003)(68736007)(66556008)(14454004)(8936002)(53936002)(66476007)(64756008)(26005)(73956011)(2906002)(52536014)(76116006)(66446008)(186003)(14444005)(256004)(476003)(7696005)(486006)(6246003)(71200400001)(81166006)(91956017)(8676002)(5660300002)(55016002)(53546011)(6506007)(81156014)(71190400001)(9686003)(33656002)(6306002)(316002)(102836004)(305945005)(110136005)(6436002)(74316002)(3846002)(25786009)(7736002)(6116002)(2501003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2777;
 H:DM6PR12MB3627.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mBcS/Ru0pLaq8hIz8EoIdE83qE5w1QIcZimEdsZlf7hIcVeyveZ53hs+ItfKWDXRJc/bkG3x11jnnBNdFET/pa3LR0SZIGJnWH1S4gOQdJFThogAQ3PF3mefmcSrpKpzlWiFQBPjEm+9r/75l2EiVPsYm5YNMjkPqlPA63cQGc3TLdTCXtxyq2aKRW1V9kfeKJRvr9v2kxkHh5hj7k1YL83+Z9fE5eYfAmSEZqVjlhKbI6fT8z7lu5XOdTd6THsOwmsOlCfQZByFRaeAI1+ffNC9FsUN4cUxM5mqmOBr4EmK9iQbbW5uN+GC1TDpP9elp66MVRN0PNBXrELtsq1+ksQUt3vLJyr1zxG61V2MiIoMpPjA78z0j53uzTbwQ2eOS9lN2AElNp0rdWKb5fEnCyTfHv/tZIFztaVCBkM9E2g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7be8f4-a28c-47f1-8359-08d6d6c5d064
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2019 10:37:21.0421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2777
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohrJhhvDr2H+ggj5drEW0iBa4jO3/uIMVphi/TS4Ptc=;
 b=qMMN+ZbeoJwwpCZJ1TB34iKjjDqq1rU9zSmYYeXoAHEVdUtrD9GW/zYEaCrfXJqtyDykgAL7Etutrmo3iB/+AhHZL+y1dh1N7dj68zsEUujektGMMwdtMTVMLxRsPp804nhw2MekRe3+l+hl7WTU7bb0lEY3JyfQq5AFk5y+h3M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IGFtZC1nZnggPGFtZC1nZngt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZiBvZiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNlbnQ6IFN1bmRheSwgTWF5IDEyLCAyMDE5IDExOjIw
IEFNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogWmhhbmcsIEhhd2tpbmcK
U3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBmaXggLVdzd2l0Y2ggd2FybmluZyBkdWUgdG8g
bWlzc2luZyBvZiBkZWZhdWx0IGNhc2UKCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KCkNoYW5n
ZS1JZDogSTQwZWQ0NDZiOGY3NDMxZWZkNzNlZjA5OTM4ZWM1ZTJiNWFiMDlmMDQKU2lnbmVkLW9m
Zi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
ZGZfdjNfNi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCmluZGV4IGQy
YWNmY2NlNzE1MC4uMjAxYzAwNDExNzIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9kZl92M182LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNf
Ni5jCkBAIC00NzYsNiArNDc2LDggQEAgc3RhdGljIGludCBkZl92M182X3BtY19zdGFydChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0X3QgY29uZmlnLAoKICAgICAgICAgICAgICAg
IHJldCA9IDA7CgorICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgZGVmYXVsdDoKICAgICAg
ICAgICAgICAgIGJyZWFrOwogICAgICAgIH0KCkBAIC01MDQsNiArNTA2LDggQEAgc3RhdGljIGlu
dCBkZl92M182X3BtY19zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRfdCBj
b25maWcsCiAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IDA7CgogICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKKyAgICAgICBkZWZhdWx0OgorICAgICAgICAgICAgICAgYnJlYWs7CiAg
ICAgICAgfQoKICAgICAgICByZXR1cm4gcmV0OwpAQCAtNTI3LDYgKzUzMSw4IEBAIHN0YXRpYyB2
b2lkIGRmX3YzXzZfcG1jX2dldF9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAg
ICAgICAgICAgICAgICAgICAgICAgZGZfdjNfNl9nZXRfeGdtaV9saW5rX2NudHIoYWRldiwgeGdt
aV90eF9saW5rLCBjb3VudCk7CiAgICAgICAgICAgICAgICB9CgorICAgICAgICAgICAgICAgYnJl
YWs7CisgICAgICAgZGVmYXVsdDoKICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgIH0KCi0t
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
