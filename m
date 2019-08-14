Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1848DBF2
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 19:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A66B6E79E;
	Wed, 14 Aug 2019 17:35:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790073.outbound.protection.outlook.com [40.107.79.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82EE6E79E
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 17:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuoCp+w6pPZyRI+wHfcy4HMfdz5ja9L+82h5qMW8sUhsyjyRO+h1detHOjynCSuVi9Bw6Q1E+0rkMCdHaPXUBcaDnptj4cKeQyRv8MkEWaWjVGaXiwAPVs7gIE4cNEVj0n1+NXixh+GlNHqqezWd5YINhICFyB3bc8Eael0FIvHIshS9psUBa68uNzLDZD1Ke78Hm0uZ/kDoGHThciinaVp3qvIq0OIKkvFWTA2hvO2i1APN1uTY8O+ewCvkbZtP7Pbkv5Xuc1kN2Nqb8rzfmdKV6ekvkcw7iEJMK9geB3rjSB/5v3CG1Mq7pUh7rIMP9Tn62lckvk00FrsUNw8E8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN4n6VhsHG2rj/9vhmas7f84skSMjZoTUim8ETTm5s4=;
 b=NQpUuq9wN8uzQ41poldaVGhdRp5tfc2uPqyynMgYk1uX0BfR+gpB0mRJRpwwTmbky2faWLdjk79GSXgWifY7knc3H9f9EtrpWmbHkVpPfwXn/rEU92B5YVczIpJzK1fVvYUDDGWsklYZDNl6i1XnyzEbeXdcFtlLyxP/qtYc/123XrvzOzva2s5kYiZEvEs+NqoUCqVaoz907uUaw6GC7WjuAv/60vAFL1xPEIRBRamc6HO2iNvdezg/LJZ8CjNOj1XYMk6XvYv8X4++9TiU/0m/XDPpgftxT1M+iIJ5aze6weJ+NXgfykY9yhOS4LKpN4MAna/4mKS8KEkkN81qrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1203.namprd12.prod.outlook.com (10.168.225.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Wed, 14 Aug 2019 17:35:16 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 17:35:16 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Update VM function pointer
Thread-Topic: [PATCH] drm/amd/amdgpu: Update VM function pointer
Thread-Index: AQHVUsai5XCv8dwXBE6km7pyEAQKvw==
Date: Wed, 14 Aug 2019 17:35:15 +0000
Message-ID: <1565804106-21037-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edc5a49e-3e00-4a73-d8e0-08d720ddc4be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1203; 
x-ms-traffictypediagnostic: BN6PR12MB1203:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB12038CE8200807260D6CB678FFAD0@BN6PR12MB1203.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(189003)(199004)(64756008)(256004)(8936002)(36756003)(50226002)(53936002)(305945005)(6116002)(3846002)(66556008)(4326008)(66446008)(66946007)(81156014)(66476007)(14444005)(25786009)(8676002)(81166006)(478600001)(99286004)(66066001)(316002)(6506007)(2501003)(5640700003)(2351001)(26005)(486006)(476003)(7736002)(14454004)(186003)(102836004)(6916009)(386003)(52116002)(5660300002)(15650500001)(2616005)(2906002)(6486002)(6512007)(4744005)(71190400001)(6436002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1203;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ibamsrhQ71xOpW4EW6dopUf3xBb9/W55FmlCdGThgoRX6YI3nm/zjlfzrr9OQytcSuwHryao2AEvPGNobB/jlwBIs/qYGEaHdaUpedmaZ42+3R1sCOPmzzLqkaHsJGStDsaeDO4V/wUZDutefBNL3EFxE5XENRzVDlX2fr342EVSaTs9fNJ1TLu8djCTcpchlKZxgOjlwnBjwxG5KTbVBeWJ0Scldprx5DTozTA8d4Wcwbg2yGqHwUZjSBjStOoju+cGqyka/b10xxkvIp8RKzg5wRWQM3u3yI+0cF0Ywg3Uerhs9BR/EKoQRcyCI1/CyyWxQ/EZGN6Z6Gu1MEZQ3qu5F1ptQWKfrHO0o+PYAUMUHLHkacqoGWYDh2PlrGVeczouZn+jZ8XZ5amXrE39QOU1v5P5KP4lMpps156/A50=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc5a49e-3e00-4a73-d8e0-08d720ddc4be
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 17:35:15.9686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+VHDAOAJNdr9nzP35oxewXu4pGKJ4WBQE1bt2cWVHnRtfNTNzMYOSn9acbyvXpp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1203
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN4n6VhsHG2rj/9vhmas7f84skSMjZoTUim8ETTm5s4=;
 b=QFUqsDVsx9sh+0IA/dHSUJUANxVUNd3yUTiti+6CrWhoaxmBt8Oz7cR3muOZIX6TMh5Ljt1YHJMn+39haDT2mjb+rbl+qhlXAO1hH2LsW60hhONKc4IzfGkag6q2YTQoXAGPFJs4Ow/ePiHUSwqz4GsP5cDiF8HN2Yrz7s5NcJg=
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

ICBXaGVuIFZNIHN0YXRlIGNoYW5nZWQgYW5kIHN5c3RlbSBpbiBsYXJnZSBiYXIgbW9kZSwKICBt
YWtlIHN1cmUgdG8gdXNlIENQVSB1cGRhdGUgZnVuY3Rpb24sIG90aGVyd2lzZSB1c2UKICBTRE1B
IGZ1bmN0aW9uLgoKQ2hhbmdlLUlkOiBJYmNmYWRhNTYwYTAwYzlhZWViZmQ5MjJhZTQ4ZGU5MjBl
NDRhNTg2NgpTaWduZWQtb2ZmLWJ5OiBHYW5nIEJhIDxnYWJhQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
CmluZGV4IGMxYmFmM2QuLjdkZGNhM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCkBAIC0yODYyLDYgKzI4NjIsMTMgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLCB1bnMKIAlX
QVJOX09OQ0UoKHZtLT51c2VfY3B1X2Zvcl91cGRhdGUgJiYgIWFtZGdwdV9nbWNfdnJhbV9mdWxs
X3Zpc2libGUoJmFkZXYtPmdtYykpLAogCQkgICJDUFUgdXBkYXRlIG9mIFZNIHJlY29tbWVuZGVk
IG9ubHkgZm9yIGxhcmdlIEJBUiBzeXN0ZW1cbiIpOwogCisJaWYgKHZtLT51c2VfY3B1X2Zvcl91
cGRhdGUpCisJCXZtLT51cGRhdGVfZnVuY3MgPSAmYW1kZ3B1X3ZtX2NwdV9mdW5jczsKKwllbHNl
CisJCXZtLT51cGRhdGVfZnVuY3MgPSAmYW1kZ3B1X3ZtX3NkbWFfZnVuY3M7CisJZG1hX2ZlbmNl
X3B1dCh2bS0+bGFzdF91cGRhdGUpOworCXZtLT5sYXN0X3VwZGF0ZSA9IE5VTEw7CisKIAlpZiAo
dm0tPnBhc2lkKSB7CiAJCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
