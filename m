Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227C16F2C
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 04:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DBF89CC9;
	Wed,  8 May 2019 02:45:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800073.outbound.protection.outlook.com [40.107.80.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD67289CC9
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 02:45:50 +0000 (UTC)
Received: from CY4PR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:910:16::11) by BN8PR12MB3476.namprd12.prod.outlook.com
 (2603:10b6:408:48::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Wed, 8 May
 2019 02:45:49 +0000
Received: from DM3NAM03FT047.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by CY4PR1201CA0001.outlook.office365.com
 (2603:10b6:910:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 02:45:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT047.mail.protection.outlook.com (10.152.83.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 02:45:48 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 21:45:46 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/9] Enable new L1 security for Vega10 SR-IOV
Date: Wed, 8 May 2019 10:45:32 +0800
Message-ID: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(7696005)(316002)(23676004)(14444005)(50226002)(68736007)(6916009)(426003)(305945005)(53416004)(2351001)(336012)(54906003)(478600001)(2870700001)(36756003)(77096007)(2616005)(186003)(26005)(356004)(72206003)(6666004)(476003)(5820100001)(126002)(486006)(70206006)(4326008)(53936002)(47776003)(86362001)(50466002)(70586007)(15650500001)(2906002)(81166006)(5660300002)(81156014)(8936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3476; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88c4a973-dd9b-4923-011b-08d6d35f46eb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN8PR12MB3476; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3476:
X-Microsoft-Antispam-PRVS: <BN8PR12MB347686A6CC99EA8578C4AD0CFE320@BN8PR12MB3476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: g9bfjr1UeMMkQIs/JcWpaIkWjGlevcpDwVHm16AOmFY2bA+2rGwk9dJD/2SiwVE62QNRrBe8xr3NWeRuWfYjaSmNrsgC92EHZJJd44TjpSL7BbGHGQphaEYlP+JuuYVmlMuFTlZNn2jBh00YlcHQbKvaLOsqeSR/ZqG+yr0tW69/2d/Os1wGFGrgaoDCHDdh8r3UmaScwEmTuZOaq4RPi80PkHI+s28G0fmsnzkkYaSQoSL3GUGyC1f4R2cg9hhKetxdM7pCWz3tc3QrzSy0SDzAG5kNorwNW30qKhORTf8ZVxqihc4Z30dT4+AsiGgROQoKi3ZEnahpUAnSdpD7+Qsm7FH7orR9jhHJWT2BklKB9DcrFV0yA8JIZ2YZN1dXSja8knpYaebEVopjRlk87N6QbvNVbsOTxJLCu5e3qHE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 02:45:48.3503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c4a973-dd9b-4923-011b-08d6d35f46eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhXkAKQJMTQxkZl1JCJQWPbOxIyClnp/KJXMLx+SDic=;
 b=AhTY+Da44uZ5CzZ8NaExKXXefRM+n6fJj7IiGWM/T0UdXaCgRerxj1nn1mEa0nEgSAl2ze0u+5+XY6fJLSzV57Fbhe6k4v+calwd7q8+DkArIiWk2+fDzSS+75siLtJdAAig9vZdEsK87EReQGF0EyKwlUPgfsf/A34kYopRK4A=
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
Cc: Daniel.Wang2@amd.com, Rashid.Sohail@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG8gc3VwcG9ydCBuZXcgVmVnYTEwIFNSLUlPViBMMSBzZWN1cml0eSwgS01EIG5lZWQgc29tZSBt
b2RpZmljYXRpb25zCiAgICAgICAgMTogRHVlIHRvIHRoZSBuZXcgZmVhdHVyZXMgc3VwcG9ydGVk
IGluIEZXKFBTUCwgUkxDLCBldGMpLAogICAgICAgICAgIGZvciByZWdpc3RlciBhY2Nlc3MgZHVy
aW5nIGluaXRpYWxpemF0aW9uLCB3ZSBoYXZlIG1vcmUKICAgICAgICAgICBtb2RlczoKICAgICAg
ICAgICAgICAgIDEpLCByZXF1ZXN0IFBTUCB0byBwcm9ncmFtCiAgICAgICAgICAgICAgICAyKSwg
cmVxdWVzdCBSTEMgdG8gcHJvZ3JhbQogICAgICAgICAgICAgICAgMyksIHJlcXVlc3QgU1ItSU9W
IGhvc3QgZHJpdmVyIHRvIHByb2dyYW0gYW5kIHNraXAKICAgICAgICAgICAgICAgICAgICBwcm9n
cmFtbWluZyB0aGVtIGluIGFtZGdwdQogICAgICAgICAgICAgICAgNCksIExlZ2FjeSBNTUlPIGFj
Y2VzcwogICAgICAgICAgIFdlIHdpbGwgdHJ5IHRvIHJlYWQgdGhlIGZpcm13YXJlIHZlcnNpb24g
dG8gc2VlIHdoaWNoIG1vZGUKICAgICAgICAgICBpcyBzdXBwb3J0CgogICAgICAgIDI6IElmIFBT
UCBGVyBzdXBwb3J0IHRvIHByb2dyYW0gc29tZSByZWdpc3RlcnMsIHN1Y2ggYXMgSUgsCiAgICAg
ICAgICAgd2UgbmVlZDoKICAgICAgICAgICAgICAgIDEpLCBpbml0aWFsaXplIFBTUCBiZWZvcmUg
SUgKICAgICAgICAgICAgICAgIDIpLCBzZW5kIHRoZSBzcGVjaWZpYyBjb21tYW5kIHRvIFBTUAoK
ICAgICAgICAzOiBTdXBwb3J0IFZNUiByaW5nLiBWTVIgcmluZywgY29tcGFyZWQgd2l0aCBwaHlz
aWNhbCBwbGF0Zm9ybQogICAgICAgICAgIFRNUiByaW5nLCB0aGUgcHJvZ3JhbSBzZXF1ZW5jZSBh
cmUgbmVhcmx5IHRoZSBzYW1lLCAgYnV0IHdlCiAgICAgICAgICAgd2lsbCB1c2UgYW5vdGhlciBy
ZWdpc3RlciBzZXQsIG1tTVAwX1NNTl9DMlBNU0dfMTAxLzEwMi8xMDMKICAgICAgICAgICB0byBj
b21tdW5pY2F0ZSB3aXRoIFBTUAoKICAgICAgICA0OiBTa2lwIHByb2dyYW1taW5nIHNvbWUgcmVn
aXN0ZXJzIGluIGd1ZXN0IEtNRAogICAgICAgICAgIEFzIHNvbWUgcmVnaXN0ZXJzIGFyZSBwcm9j
ZXNzZWQgYnkgbmV3IEwxIHNlY3VyaXR5LCBhbWRncHUKICAgICAgICAgICBvbiBWRiB3aWxsIGZh
aWwgdG8gcHJvZ3JhbSB0aGVtLCBhbmQgZG9u4oCZdCB3b3JyeSwgdGhlc2UKICAgICAgICAgICBy
ZWdpc3RlcnMgd2lsbCBiZSBwcm9ncmFtbWVkICBvbiB0aGUgU1ItSU9WIGhvc3QgZHJpdmVyCiAg
ICAgICAgICAgc2lkZS4KCiAgICAgICAgNTogQ2FsbCBSTEMgdG8gcHJvZ3JhbSBzb21lIHJlZ2lz
dGVycyBpbiBpbnN0ZWFkIG9mIE1NSU8KICAgICAgICAgICBXaXRoIG5ldyBMMSBwb2xpY3ksIHNv
bWUgcmVnaXN0ZXJzIGNhbuKAmXQgYmUgcHJvZ3JhbW1lZCBpbgogICAgICAgICAgIFNSLUlPViBW
RiBhbWRncHUgd2l0aCBNTUlPLiBGb3J0dW5hdGVseSwgbmV3IFJMQyBmaXJtd2FyZQogICAgICAg
ICAgIHdpbGwgc3VwcG9ydCB0byBwcm9ncmFtIHRoZW0gd2l0aCBzcGVjaWZpYyBwcm9ncmFtIHNl
cXVlbmNlLAogICAgICAgICAgIHdoaWNoIGFyZSBkZXNjcmliZWQgaW4gdGhlIHBhdGNoIGNvbW1p
dCBtZXNzYWdlCgpUcmlnZ2VyIEh1YW5nICg5KToKICBkcm0vYW1kZ3B1OiBpbml0IHZlZ2ExMCBT
Ui1JT1YgcmVnIGFjY2VzcyBtb2RlCiAgZHJtL2FtZGdwdTogaW5pdGlhbGl6ZSBQU1AgYmVmb3Jl
IElIIHVuZGVyIFNSLUlPVgogIGRybS9hbWRncHU6IEFkZCBuZXcgUFNQIGNtZCBHRlhfQ01EX0lE
X1BST0dfUkVHCiAgZHJtL2FtZGdwdTogaW1wbGVtZW50IFBTUCBjbWQgR0ZYX0NNRF9JRF9QUk9H
X1JFRwogIGRybS9hbWRncHU6IGNhbGwgcHNwIHRvIHByb2dybSBpaCBjbnRsIGluIFNSLUlPVgog
IGRybS9hbWRncHU6IFN1cHBvcnQgUFNQIFZNUiByaW5nIGZvciBWZWdhMTAgVkYKICBkcm0vYW1k
Z3B1OiBTa2lwIHNldHRpbmcgc29tZSByZWdzIHVuZGVyIFZlZ2ExMCBWRgogIGRybS9hbWRncHU6
IGFkZCBiYXNpYyBmdW5jIGZvciBSTEMgcHJvZ3JhbSByZWcKICBkcm0vYW1kZ3B1OiBSTEMgdG8g
cHJvZ3JhbSByZWdzIGZvciBWZWdhMTAgU1ItSU9WCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjkuYyB8ICAzMCArKy0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgICAgICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgICAgICAgICAgIHwgIDI4ICsrKysrCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggICAgICAgICAgIHwgIDExICstCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jICAgICAgICAgIHwgIDQzICsrKysrKysK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmggICAgICAgICAgfCAgMTIg
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgICAgICAgICAgfCAx
MTQgKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHVi
X3YxXzAuYyAgICAgICAgICB8ICAyMCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jICAgICAgICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21taHViX3YxXzAuYyAgICAgICAgICAgfCAgMjUgKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L214Z3B1X2FpLmMgICAgICAgICAgICAgfCAgMTkgKysrKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvcHNwX2dmeF9pZi5oICAgICAgICAgICB8ICAgOCArKwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYyAgICAgICAgICAgICB8IDEzMSArKysrKysrKysrKysr
KysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgICAgICAg
ICAgIHwgIDE0ICsrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAg
ICAgICAgICB8ICA1MiArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
X2NvbW1vbi5oICAgICAgICAgfCAgNTcgKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmVnYTEwX2loLmMgICAgICAgICAgICB8ICA5MSArKysrKysrKysrKysrLS0KIDE3IGZp
bGVzIGNoYW5nZWQsIDUxNCBpbnNlcnRpb25zKCspLCAxNDggZGVsZXRpb25zKC0pCgotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
