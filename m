Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562F9850F
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 22:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65F56EA05;
	Wed, 21 Aug 2019 20:02:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790052.outbound.protection.outlook.com [40.107.79.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1536EA05
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 20:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5KRYGXPyQItls5TtPfU2eL6lh9ydlVv2ivlDPTlJ74z3XgGm8fu5yzFZ/b6Spqrmr3jh0iOpajwCbaQeEpwnVCrLuZ7fxHt1w8XBpKNWf6Y15g20hL6tHAt8cSK9l/Ho+EZvOQfW+rsOalZUSHTgfKXLGW8+y6z5eAFoRtOWyrC2FJ9pPsmfLosZq7iKBDoMC+oJniL4b2orGqvRcSfcvx1t7LQRvdmvt9/jQNrVGNJlqfH+l90lgUssFoD0xIYoHdSsElTFj4chp6e251edNlM2AwZvErcaj5fXi7yaGJo+3zYBsqWvmvkJSPNsCNIeZSQ1zsRtt741InXUEMDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb7Jv5xvvMK6VMcwnrZJF3nrshOXciecFnQPz87KWhc=;
 b=TXKBatetETUDVKca9noYUB/9K9+heWnGYdf+qVVfpnmFadZEaLeGsMJJ4gnD6fWauRrmkkBN5AC2jL1xtD+dbtnbCcGFkbuE3ig7n2R5Hpv2Hy+oNOqR/dv5NppFWreuDCfeKK2FK+tGo6EqCXogtwaYJWq9Vpmqln0akwiu9ugPYARn5k+YNDsC9bT8zy0GtpAwz7VzKGqsM2RFmc8B89a4V+TSaj3cXVRw/RhsNVb4k0FPZ3lsXB3v0fpn5plrnJkR9KvsAO/P8z636AWZDntb1+xYNFLs7XntADJ+Z9DCWWaWw2Rpiz8H676h8HT8XM+2aK/akucB6JDPVF/ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0003.namprd12.prod.outlook.com (2603:10b6:403:2::13)
 by BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:02:29 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by BN4PR12CA0003.outlook.office365.com
 (2603:10b6:403:2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 20:02:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:02:29 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 21 Aug 2019 15:02:14 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 0/4] Add RAS EEPROM table and I2C driver implementation.
Date: Wed, 21 Aug 2019 16:01:55 -0400
Message-ID: <1566417719-1528-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(2980300002)(428003)(199004)(189003)(305945005)(70586007)(478600001)(70206006)(47776003)(36756003)(81156014)(8676002)(81166006)(316002)(6916009)(54906003)(16586007)(8936002)(50226002)(5660300002)(2351001)(486006)(186003)(126002)(86362001)(14444005)(476003)(6666004)(2616005)(2906002)(336012)(356004)(53936002)(7696005)(51416003)(4326008)(50466002)(48376002)(426003)(53416004)(44832011)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b5b85d2-a288-4c7a-572b-08d726727f18
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265B84F7653816885F41618EAAA0@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YYt6Elhb+D09tgotNgio91pyrF76CyWlx4r8/jnCYJzdJsLP+r0DiQzoaBpKiptjC5oCQpBCpovJ+7VXVwHzocOBzsIXbhuwr0YSosGrO0o579pa6JMpx/R7x3EeyvbXgrK39471Z4LGOZbFqXH0lR0eVKjHzrnoVEwOwwoygtjfgGfDxDPvB8RAvToTEgbIc5NoM/mnN4DKcZB+ifNvRWi3+LOlbJuZsU+C5wcdlVGDkTVMyYqoeY5VPmi+IV7RjbayG1YRq1Y6dut7+ImCR/RyOVJ9MVWENyl4f80m7jm8a8dcLGLtGfHbFsXm+WRDYvgu+w9RQ/gVhtvBnUDAYSi1mSAbSvlhh82vqCxruRny+rK8cZRxyJXwrWQ3hkqIKgW318hdmA5ETIEx2MrSJzaonsbqvzenZcyxkJrqXJA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:02:29.5322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5b85d2-a288-4c7a-572b-08d726727f18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb7Jv5xvvMK6VMcwnrZJF3nrshOXciecFnQPz87KWhc=;
 b=MQhF+hawZv4AmYFUYXEHmz3I6Kt+0pDMh/8uRS//07TS6xOMIzPCmCvUee0M4uVHgEfODHI6S+pu0Dio02fnoSYJi1SxV/ojOD2LQtnWDa+W90Nj/awbVsrUyS5Cb9Z/VXKZwa6ZAji5JSev5Xv88rrTkT0g6MF/BzIRwzobrvE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: David.Panariti@amd.com, Lijo.Lazar@amd.com,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Xinhui.Pan@amd.com,
 Luben.Tuikov@amd.com, Kent.Russell@amd.com, Tao.Zhou1@amd.com,
 Alexander.Deucher@amd.com, evan.quan@amd.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXQgaW50cm9kdWNlcyBFRVBST00gdGFibGUgdG8gc3RvcmUgUkFTIGVycm9y
cyB3aGljaCByaXNlCmR1cmluZyBydW4gdGltZSBzbyBvbiBuZXh0IGRyaXZlciBsb2FkIHRob3Nl
IGVycm9ycyBjYW4gYmUgcmV0cmlldmVkCmFuZCBhY3Rpb24gdGFrZW4gb24gdGhlbSAoZS5nLiBS
ZXNlcnZlIGJhZCBtZW1vcnkgcGFnZXMgdG8gZGlzYWxsb3cKdGhlaXIgdXNhZ2UgYnkgdGhlIEdQ
VSkuCgpGaXJzdCBwYXRjaCBpcyBIVyBpbmRlcGVuZGVudCBFRVBST00gdGFibGUgbWFuYWdlciB3
aGlsZSB0aGUgbmV4dCAzCmFyZSBWZWdhIDIwIHNwZWNpZmljIEkyQyBjb250cm9sbGVyIGltcGxl
bWVudGF0aW9uIHRvIGRvIHRoZSBhY3R1YWwKRUVQUk9NIHJlYWQvd3JpdGUgb3ZlciBJMkMuCgpJ
bnRlZ3JhdGlvbiBvZiB0aGlzIGNvZGUgaW50byBSQVMgd2lsbCBmb2xsb3cgc29vbi4KCnYyOgpB
ZGQgaW1wcm92ZWQgSTJDIGNvbnRyb2xsZXIgVFggYnVmZmVyIGZpbGxpbmcgdG8gYXZvaWQgdGhl
IHNsYXZlCmludGVycHJldGluZyBpZGxlIGRhdGEgbGluZSAoU0RBKSBhcyB2YWxpZCBkYXRhLgoK
djM6CkZpeCByZWNvcmRzIHN0b3JlIGFkZHJlc3MgY2FsY3VsYXRpb24gYnVnIGluIEVFUFJPTSBt
YW5hZ2VyLgpGaXggYnVncyBpbiBJMkMgZHJpdmVyIGFuZCByZXZldCB0aGUgb3B0aW1pemF0aW9u
IGZyb20gVjIgYXMgaXQncyBzdXBlcmZsdW91cy4KUmVtb3ZlIHRoZSBoYWNrIGZyb20gU01VIGlu
dGVyZmFjZSBhcyB0aGUgU01VIGZvdW5kIGFuZCBmeGllZCB0aGVpciBidWcuCgp2NDoKRml4IENS
QyBjYWxjdWFsdGlvbiBidWcgYW5kIGFkZHJlc3Mgc29tZSBzdHlsZSBjb21tZW50cyAgZnJvbSBw
cmV2b2l1cwpyZXZpZXcuCgpBbmRyZXkgR3JvZHpvdnNreSAoNCk6CiAgZHJtL2FtZGdwdTogQWRk
IFJBUyBFRVBST00gdGFibGUuCiAgZHJtL2FtZDogSW1wb3J0IHNtdWlvXzExXzAgaGVhZHJlcyBm
b3IgRUVQUk9NIGFjY2VzcyBvbiBWZWdhMjAKICBkcm0vYW1kL3Bvd2VycGxheTogQWRkIGludGVy
ZmFjZSB0byBsb2NrIFNNVSBIVyBJMkMuCiAgZHJtL2FtZGdwdTogVmVnYTIwIFNNVSBJMkMgSFcg
ZW5naW5lIGNvbnRyb2xsZXIuCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuaCAgICAgICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXNfZWVwcm9tLmMgICAgIHwgNDgzICsrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5oICAgICB8ICA5MCArKysKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYyAgICAgICAgIHwgNzEwICsrKysrKysr
KysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5o
ICAgICAgICAgfCAgMzQgKwogLi4uL2luY2x1ZGUvYXNpY19yZWcvc211aW8vc211aW9fMTFfMF8w
X29mZnNldC5oICAgfCAgOTIgKysrCiAuLi4vaW5jbHVkZS9hc2ljX3JlZy9zbXVpby9zbXVpb18x
MV8wXzBfc2hfbWFzay5oICB8IDIzMSArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUva2dkX3BwX2ludGVyZmFjZS5oICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRfcG93ZXJwbGF5LmMgICAgICB8ICAxNiArCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyB8ICAxOSArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaCAgICAgICAgICB8ICAgMSArCiAuLi4vZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhMjBfc211bWdyLmMgICB8ICAgMiArLQogLi4uL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYTIwX3NtdW1nci5oICAgfCAgIDIgKwogMTQgZmls
ZXMgY2hhbmdlZCwgMTY4NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
X2VlcHJvbS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c211X3YxMV8wX2kyYy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc211X3YxMV8wX2kyYy5oCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
