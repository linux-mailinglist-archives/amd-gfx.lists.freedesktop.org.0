Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C279BF94D
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028086EDC2;
	Thu, 26 Sep 2019 18:38:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70626EDC2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAk67MBVHDeOGaK5fp4Qj8bOR7tnKjCbAyVlHFFgbeGBbLbFSx6z2pjIQDPQq6ZK2mK7xB7lqfjlYJG5RyuTfCI8gAYhmXgYhHXVuszF42l1mmqymOsU/er3A2WQ0He7pY1yc+W53PQZaMszSrZbNk/92fwZY4C91CE8ZiTkrO4fkRS649CIuzxN+lWuw709dk/4RqcT4jgeDX83yqKzAgW77BT8cPHI/cwVEpbLAomj1KbZI/7Quvz0oyxaDLA+FTY3a/8kvtiW24/v0yinaLlWacsMEoI3V91xq/2lFVvklKk8KvVLOqD5AVbScxsKhcqgLDFjlvMPBDTywrogIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRqs8pyCXpkzFTQttUZDj1NcNrsANP3Qx6jQeV0vgss=;
 b=D9EmHf8f4Wyv9mwQ0QwaBuiqEMPWjtHnaqPlr26kLgwpxt2pf7TsEgwepzKd1oLfSjfxmQ+AwGI6Sfc8eZhYP/6VhginOAzM2AW7NktOi14P5p9kAcpXplYe+NP2P2tNE4aMK4NwO0Vk/x2voaOTDdYR0YN8Rjb9N2dk8wcZ5DVSOZxPOPqzEFenQ9xD0m50mkxPKbXreGFQO2p3nrNlAjaqi386/4HFnd1d0//vjJVPJXb6Kf6IiBsNHueLa2xazrhTfDLNRXiSe87tce+bpeLp0PikHFou8i/GzHS903csuu6FCzJTc89XKucg2pRI8Mi1bsl/DfSkC9TR/QJ4vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 18:38:45 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 18:38:45 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdkfd: Delete unused defines
Thread-Topic: [PATCH 2/6] drm/amdkfd: Delete unused defines
Thread-Index: AQHVdJmhsbu2fpLAaEyQR9QQtTM3jQ==
Date: Thu, 26 Sep 2019 18:38:45 +0000
Message-ID: <20190926183826.18813-2-Yong.Zhao@amd.com>
References: <20190926183826.18813-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926183826.18813-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e51f92dd-d1e8-42a4-b348-08d742b0c360
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3466; 
x-ms-traffictypediagnostic: DM6PR12MB3466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3466E95D93B5D82856795D5BF0860@DM6PR12MB3466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(11346002)(476003)(6436002)(305945005)(7736002)(50226002)(14454004)(8936002)(81156014)(81166006)(4744005)(8676002)(256004)(5660300002)(14444005)(2351001)(6512007)(4326008)(86362001)(316002)(76176011)(2501003)(2906002)(186003)(3846002)(6116002)(99286004)(52116002)(71200400001)(71190400001)(102836004)(25786009)(1076003)(26005)(36756003)(66066001)(6916009)(6506007)(386003)(478600001)(64756008)(66556008)(5640700003)(486006)(66446008)(446003)(66946007)(2616005)(6486002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3466;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L7LChRkmb5lELZE/J/043O7/Y4rmMa6qtSYnWPl0OMqneF3RbbVnz6xKmCJy66p4tY5LGDgTprfzsDPyTeeO8d78F0zI1/P8aur/WX9H4xDZU5EAIHhyQmoGxs4tavl2TlL1SVC0BujZAsqDDHrCEXZlYWtXBYFNo5tew2JMprjKO7CLPFFCG/CFzTso+aIXFuKkaVzSrKYLeF7geN3jcylK6+FEh2RskRRv1HAhoS01ozlRyMKy1zExjilsGlEztBjY+uJq46n6OiqXM9/6tPXG2zdMx6/dAoGQ+Kah+1Q/TOjy9MsJCx6d3MNwEn8c2cyYhaJUpHmyW4IcX8wr8m4F0L1Jdr3QLMCH2L4jDXfRR5HKuyabL4HO/arJfaRiVsRclwKc7qWncfvS78byNouThacXiPTGx3mmfro3VHA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51f92dd-d1e8-42a4-b348-08d742b0c360
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:38:45.8205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2oGPZuIp8M9ri9lsy8tdhefABeISbCDTBunzEYpXGoX0YsST6mjPlIxV7I9W+Yh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRqs8pyCXpkzFTQttUZDj1NcNrsANP3Qx6jQeV0vgss=;
 b=OBGW/6MBWVNIBS5jVVi3t86Dj5D8qUCuC1aQKx5VNlKgwda0s6r2paLnXjp1TF9UBzYjgMPWerQwX5reqSDSVqBV0qficNxCE240NJNafmGTq2XajH3VjWx77KZzQs2BcCw661y8ofznnLIBg1Q87NMI+JbGNEQcPUE1Tj/kCPg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhleSBhcmUgbm90IHVzZWQgYW55d2hlcmUuCgpDaGFuZ2UtSWQ6IEllYmE0ZjU3NzYwZjBjNDVm
MjRlNTQ2MjkyNDVjYWU0MTliOGZmMTU3ClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5a
aGFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9nZnhfdjkuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuYwppbmRl
eCA0OWNkOTQ2YmY4YjQuLmY4ZjhkNmZlOGI1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OS5jCkBAIC01Miw5ICs1Miw2IEBACiAjaW5j
bHVkZSAiZ21jX3Y5XzAuaCIKIAogCi0jZGVmaW5lIFY5X1BJUEVfUEVSX01FQwkJKDQpCi0jZGVm
aW5lIFY5X1FVRVVFU19QRVJfUElQRV9NRUMJKDgpCi0KIGVudW0gaHFkX2RlcXVldWVfcmVxdWVz
dF90eXBlIHsKIAlOT19BQ1RJT04gPSAwLAogCURSQUlOX1BJUEUsCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
