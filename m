Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA3F8850D
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C256EEC8;
	Fri,  9 Aug 2019 21:38:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780084.outbound.protection.outlook.com [40.107.78.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6E36EEC4
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaXz0pcmktnbdDaV9iUuHib0ys6eTZAd9lekQMZ+PFTH84Xoa1hJOmxvD80Fe0lEsEEMXxYli3sHyEDTU47PJTUpetFV9v1q7JU/blOd3QWEXTc94cuKnNzQZbeWthFagZj/i0KsBGwFhB4Qhyynm6+j9POgtx1VU6F9BLyhSoxdurIEZA14ti3C7G1qB1c1eEb5puw7LZShQmEZIx3npt0Z8vaEPQc6pB7kfCMZhDrS9/hyESwk0HIb2oQyp+YfMuUWC2iy7G4Kd22NYe4gewLxoyyT6riu/0XOjdCY3t629/4GlF5w5wGHI7SUKnJqz7mC0ucWKTD9u2/8CehRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huiKNni58Ms1JBuB2IQGjaQzWcPYSWuzOgeWE/8msYA=;
 b=HemvrPX3pO0RQMgCHV0uf6XcyfaLcdImyp+PzaryAasfEDobjS30njbDRov0/dIcsgeK+QVn3BBJdfzFj6GkAl2BRssdBwa2g2cXkxoUjC/mYmRSVWq+Gats90rsYcCeIUknm4DE+eGW9q+aoC1tl/4wkH0jzoWsNPAi5G8RWCFd+KalM98YmL2Bk1Q7KXVOrJZoZJv3CrL3Ip8VVyJ4H/EEuWtqT5nQBqM34FdjLlKAVYz8cUhX8WpMEiQqsScUIwJ9XzT6E+Lj0JcPqL2zb6aLewDzvCUyo63stR9fb4tewhFr159lTOqWO2sCH+qbdaJQ0R4ifO70DETJrhwj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:405:4c::30) by CY4PR12MB1272.namprd12.prod.outlook.com
 (2603:10b6:903:3e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12; Fri, 9 Aug
 2019 21:38:51 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by BN6PR1201CA0020.outlook.office365.com
 (2603:10b6:405:4c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:51 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:41 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 37/49] drm/amd/display: Register VUPDATE_NO_LOCK interrupts
 for DCN2
Date: Fri, 9 Aug 2019 17:37:30 -0400
Message-ID: <20190809213742.30301-38-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(2980300002)(428003)(189003)(199004)(426003)(26005)(8936002)(81156014)(86362001)(126002)(11346002)(8676002)(53936002)(50466002)(5660300002)(186003)(305945005)(4326008)(76176011)(14444005)(446003)(81166006)(70586007)(48376002)(49486002)(2870700001)(316002)(2906002)(47776003)(476003)(2351001)(51416003)(2616005)(356004)(54906003)(36756003)(6666004)(336012)(50226002)(2876002)(6916009)(486006)(1076003)(70206006)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45d16314-d337-48db-20f7-08d71d11f844
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1272E36C38EDF1CBCE5DDD9C82D60@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fcVj9C80T3EdMsoQOYX3yJppQhwqzmPwN7ENqkRh8HziXlQZ2MUItkfEFRUqPhAbidhqq+wM0MsvV6xZSrtgO42eYVtjIdTQ72RyonzWI/M/MFDpiHNw6rxxpStHVr1HGm75WPgtUFDey3gIdYRjE0nHhwiwYXYAbNxFcqg9VutRpTXkQB3CFaMu3me+2zzTNpC7HDQ4o0SBTAN1x+addS4bIp+x9mYoabl7BxQBmCBq4+5QolKiaQzKxaN8I0AFugApnpO+16TxI2tCk4/j9PsfxzdU0i3Di/Kqvg7DDiZ6wIesudZdIFhEMyloURlUor4iErHrlM0NAU5peSVVPgiRI9mlSACPa5T6XvV9nt0ESWBEnDvIH+/KM8YHPShxAfiAjr4o6DSlHZXlkjja/Xzncbq1w4ldhXntkPD5vGo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:51.0906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d16314-d337-48db-20f7-08d71d11f844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huiKNni58Ms1JBuB2IQGjaQzWcPYSWuzOgeWE/8msYA=;
 b=zqvsYGjtGjCkSJ86PtWjZssnLqm4mUaoFG9VoVF12YM2ti0m9Un+4O5bdfo27L/93Hhi9kE+mwHVF74AznDkC3OPgbm4itnn4vQkJxOrKMWfomsjpluFjsDWQzp0DsEQgzabbszRSsgkNEWLRFKeA47X3EBU5ejy20lkkEYGAhI=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KVGhlc2UgYXJlIG5lZWRlZCB0byBzZW5kIGJhY2sgRFJNIHZibGFuayBldmVudHMgaW4g
dGhlIGNhc2Ugd2hlcmUgVlJSCmlzIG9uLiBXaXRob3V0IHRoZSBpbnRlcnJ1cHQgZW5hYmxlZCB3
ZSdyZSBkZWZlcnJpbmcgdGhlIGV2ZW50cyBpbnRvIHRoZQp2YmxhbmsgcXVldWUgYW5kIHVzZXJz
cGFjZSBpcyBsZWZ0IHdhaXRpbmcgZm9yZXZlciB0byBnZXQgYmFjayB0aGUKZXZlbnRzIHRoZXkg
bmVlZC4KCkZvdW5kIHVzaW5nIGlndEBrbXNfdnJyIC0gdGhlIHRlc3QgZmFpbHMgaW1tZWRpYXRl
bHkgZHVlIHRvIHZibGFuawp0aW1lb3V0LgoKW0hvd10KUmVnaXN0ZXIgdGhlbSB0aGUgc2FtZSB3
YXkgd2UncmUgaGFuZGxpbmcgaXQgZm9yIERDTjEuCgpUaGlzIGZpeGVzIGlndEBrbXNfdnJyIGZv
ciBEQ04yLgoKU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6
bGF1c2thc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNp
c0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4u
L2Rpc3BsYXkvZGMvaXJxL2RjbjIwL2lycV9zZXJ2aWNlX2RjbjIwLmMgIHwgMjggKysrKysrKysr
KysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNu
MjAvaXJxX3NlcnZpY2VfZGNuMjAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9p
cnEvZGNuMjAvaXJxX3NlcnZpY2VfZGNuMjAuYwppbmRleCA2NTg2NmQ2MjA3NTkuLjFmZGJjOWU1
ZjdiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lycS9kY24y
MC9pcnFfc2VydmljZV9kY24yMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pcnEvZGNuMjAvaXJxX3NlcnZpY2VfZGNuMjAuYwpAQCAtMTY1LDYgKzE2NSwxMSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGlycV9zb3VyY2VfaW5mb19mdW5jcyB2YmxhbmtfaXJxX2luZm9fZnVu
Y3MgPSB7CiAJLmFjayA9IE5VTEwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaXJxX3NvdXJj
ZV9pbmZvX2Z1bmNzIHZ1cGRhdGVfbm9fbG9ja19pcnFfaW5mb19mdW5jcyA9IHsKKwkuc2V0ID0g
TlVMTCwKKwkuYWNrID0gTlVMTAorfTsKKwogI3VuZGVmIEJBU0VfSU5ORVIKICNkZWZpbmUgQkFT
RV9JTk5FUihzZWcpIERDTl9CQVNFX19JTlNUMF9TRUcgIyMgc2VnCiAKQEAgLTIxOSwxMiArMjI0
LDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXJxX3NvdXJjZV9pbmZvX2Z1bmNzIHZibGFua19p
cnFfaW5mb19mdW5jcyA9IHsKIAkJLmZ1bmNzID0gJnBmbGlwX2lycV9pbmZvX2Z1bmNzXAogCX0K
IAotI2RlZmluZSB2dXBkYXRlX2ludF9lbnRyeShyZWdfbnVtKVwKKy8qIHZ1cGRhdGVfbm9fbG9j
a19pbnRfZW50cnkgbWFwcyB0byBEQ19JUlFfU09VUkNFX1ZVUERBVEV4LCB0byBtYXRjaCBzZW1h
bnRpYworICogb2YgRENFJ3MgRENfSVJRX1NPVVJDRV9WVVBEQVRFeC4KKyAqLworI2RlZmluZSB2
dXBkYXRlX25vX2xvY2tfaW50X2VudHJ5KHJlZ19udW0pXAogCVtEQ19JUlFfU09VUkNFX1ZVUERB
VEUxICsgcmVnX251bV0gPSB7XAogCQlJUlFfUkVHX0VOVFJZKE9URywgcmVnX251bSxcCi0JCQlP
VEdfR0xPQkFMX1NZTkNfU1RBVFVTLCBWVVBEQVRFX0lOVF9FTixcCi0JCQlPVEdfR0xPQkFMX1NZ
TkNfU1RBVFVTLCBWVVBEQVRFX0VWRU5UX0NMRUFSKSxcCi0JCS5mdW5jcyA9ICZ2YmxhbmtfaXJx
X2luZm9fZnVuY3NcCisJCQlPVEdfR0xPQkFMX1NZTkNfU1RBVFVTLCBWVVBEQVRFX05PX0xPQ0tf
SU5UX0VOLFwKKwkJCU9UR19HTE9CQUxfU1lOQ19TVEFUVVMsIFZVUERBVEVfTk9fTE9DS19FVkVO
VF9DTEVBUiksXAorCQkuZnVuY3MgPSAmdnVwZGF0ZV9ub19sb2NrX2lycV9pbmZvX2Z1bmNzXAog
CX0KIAogI2RlZmluZSB2YmxhbmtfaW50X2VudHJ5KHJlZ19udW0pXApAQCAtMzMxLDEyICszMzks
MTIgQEAgaXJxX3NvdXJjZV9pbmZvX2RjbjIwW0RBTF9JUlFfU09VUkNFU19OVU1CRVJdID0gewog
CWRjX3VuZGVyZmxvd19pbnRfZW50cnkoNiksCiAJW0RDX0lSUV9TT1VSQ0VfRE1DVV9TQ1BdID0g
ZHVtbXlfaXJxX2VudHJ5KCksCiAJW0RDX0lSUV9TT1VSQ0VfVkJJT1NfU1ddID0gZHVtbXlfaXJx
X2VudHJ5KCksCi0JdnVwZGF0ZV9pbnRfZW50cnkoMCksCi0JdnVwZGF0ZV9pbnRfZW50cnkoMSks
Ci0JdnVwZGF0ZV9pbnRfZW50cnkoMiksCi0JdnVwZGF0ZV9pbnRfZW50cnkoMyksCi0JdnVwZGF0
ZV9pbnRfZW50cnkoNCksCi0JdnVwZGF0ZV9pbnRfZW50cnkoNSksCisJdnVwZGF0ZV9ub19sb2Nr
X2ludF9lbnRyeSgwKSwKKwl2dXBkYXRlX25vX2xvY2tfaW50X2VudHJ5KDEpLAorCXZ1cGRhdGVf
bm9fbG9ja19pbnRfZW50cnkoMiksCisJdnVwZGF0ZV9ub19sb2NrX2ludF9lbnRyeSgzKSwKKwl2
dXBkYXRlX25vX2xvY2tfaW50X2VudHJ5KDQpLAorCXZ1cGRhdGVfbm9fbG9ja19pbnRfZW50cnko
NSksCiAJdmJsYW5rX2ludF9lbnRyeSgwKSwKIAl2YmxhbmtfaW50X2VudHJ5KDEpLAogCXZibGFu
a19pbnRfZW50cnkoMiksCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
