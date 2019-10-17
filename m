Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F53DB726
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB166EA2A;
	Thu, 17 Oct 2019 19:15:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820052.outbound.protection.outlook.com [40.107.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D706EA2A
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT2jDqDAVpp0Ovpecr8Jgv1LliKV1OZbhFzTax2Rg0ozjc1GlnHneFpQ9eiDSRxI9NOX4zy8Md/vphhZlVKoJwzlKYxKVONMGLtyHmRX5lp1L0DW6sotSKuvFqOCNtB6A5T9A286jEdK+pijrJDB+Lkd4iSShBruXFsdZO4gHufLMtAnvZDzE1hwYaAKTm8tgYkEhAtdTaWYARtQcLZSi8/eCXAHICQ0bYQuoWvqbSDwO4chd1oGd4o96dg30BkBiXki82KgWEIrMsSJ+qreLLTfRRvL5O3c13kIGB3BFW/S5coh0bdfwbvp5fie8fHZ7a1/x9K+D+o382SdkmfttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPZXgR7LHujXz/7PqaqiO5Zac2aAy5ks1uMtkd+B/gs=;
 b=CFGhlxjWIXBxQf+T+are6Eo+yAgxDIo4LAIwjBdcNM8ly+sJDClGBJJqTeBxI7mk8Bzlm9j+YVqn0lXzcHtzP1LIP6caSEUvZpHbaIGOXsqZKujG3+ELYzX0XTTQQeY2KCYxAnvMQwtVyNzf6kd/jKh2xDUTY3BGRsbe+caAPwjCbVIPZMkJcuuban3se9j666eC69NbJdbtJrNL5AoF7w6puEmj2HtVzlMOn7YeI/GP18uPeRIFPBpcVJmwklrG9nUjXhaYXHYMBpS5eMzfzhg1jib0K16uRCPS8liVQPCI1B/j8R7XTJ8zqC5su0MtvuzCttniQ0MusLBE1YLmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0025.namprd12.prod.outlook.com (2603:10b6:405:70::11)
 by CY4PR12MB1863.namprd12.prod.outlook.com (2603:10b6:903:120::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:13 +0000
Received: from CO1NAM03FT056.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by BN6PR12CA0025.outlook.office365.com
 (2603:10b6:405:70::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT056.mail.protection.outlook.com (10.152.81.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:10 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:09 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:09 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/37] DC Patches 17 Oct 2019
Date: Thu, 17 Oct 2019 15:12:52 -0400
Message-ID: <20191017191329.11857-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(428003)(189003)(199004)(186003)(305945005)(50226002)(426003)(6916009)(26005)(6306002)(2351001)(8936002)(966005)(2906002)(336012)(86362001)(4326008)(70206006)(50466002)(478600001)(70586007)(486006)(51416003)(126002)(8676002)(47776003)(6666004)(14444005)(2870700001)(36756003)(2876002)(1076003)(81156014)(356004)(81166006)(2616005)(316002)(476003)(5660300002)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1863; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d693b70b-eeaa-4b10-01aa-08d7533655c5
X-MS-TrafficTypeDiagnostic: CY4PR12MB1863:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <CY4PR12MB18638E4F1CE8422509E82592826D0@CY4PR12MB1863.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oMMq4HZ5NdgxFuZAH2/QfvLNXYEnoM/83SuUaHp1RgFYi2lMbujcfoP/3z9oB261+ujSq+WgI8chuBVm2dIpirnRR/ugtHVZ+SHWIYT7b01BHI19cp5n0kAUpEe9sPsxjDFr4UCFVHBDl0y1Bv+DOT0f+FsDHtG1UB1mzh3h13lrcRl8LoC4knehzrB2IdMvDu4j7HhwkjuEUr6ymSAeG10rT44YH1n3LHRc9RDECfAoDn9UAMlurctNNec3mX6wpElfx7P4Gn/ouPsZ+RStLtQ4P0oJLUvVhNsnKr4eSF8hTYLWlLaimR9oj3JFCJMw0p3X/fTzvCXF66JsLIS4UH2KT5vU3STBBI23+Cb+VHAWszC6KPL77YebkES8srlckKVIx0r0vR0qd8z7epwXV3eW8052FeISTxswAQoIxMXir6vWkT4xACgukHuFFezr5U0ldnwGUG3nxYgceqkQ+w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:12.6877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d693b70b-eeaa-4b10-01aa-08d7533655c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPZXgR7LHujXz/7PqaqiO5Zac2aAy5ks1uMtkd+B/gs=;
 b=Ng7R4SszV1OrVxO9o14vEBC9/hlg/jgzq6/9qRDp/aiC3B8CfxZXPpeJhg+msj4eRSi9vnoFS1HPkSaO/ZXlmTqxLzzvH5L+x5BZaQx3l9OtZKBDbGwh0d/Q1EdBduZjFdHTtsQ1Ef0U9LbGRs438VufmJDqzl2EoINz0yfS2cQ=
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpUaGlzIHNlcmllcyBoYXMgZGVwZW5k
ZW5jaWVzIG9uIHRoZSByZWNlbnQgUmVub2lyIHNlcmllczoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy82NzgwMy8jcmV2MgoKU3VtbWFyeSBvZiBjaGFuZ2VzOgoqIEVu
YWJsZSBQU1Igb24gc3VwcG9ydGVkIGVEUCBwYW5lbHMKKiBBbGxvdyBwcm9ncmFtbWluZyBvZiBu
ZWdhdGl2ZSBnYW1tYSBzbG9wZQoKCkFpZGFuIFlhbmcgKDIpOgogIGRybS9hbWQvZGlzcGxheTog
RG9uJ3QgdXNlIG9wdGltaXplZCBnYW1tYTIyIHdpdGggZWV0ZgogIGRybS9hbWQvZGlzcGxheTog
QWxsb3cgaW52ZXJ0ZWQgZ2FtbWEKCkFsdmluIExlZSAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBV
cGRhdGUgbWluIGRjZmNsawoKQW50aG9ueSBLb28gKDIpOgogIGRybS9hbWQvZGlzcGxheTogY29y
cmVjdGx5IHBvcHVsYXRlIGRwcCByZWZjbGsgaW4gZnBnYQogIGRybS9hbWQvZGlzcGxheTogUHJv
cGVyIHJldHVybiBvZiByZXN1bHQgd2hlbiBhdXggZW5naW5lIGFjcXVpcmUgZmFpbHMKCkFyaWMg
Q3lyICgyKToKICBkcm0vYW1kL2Rpc3BsYXk6IDMuMi41NQogIGRybS9hbWQvZGlzcGxheTogMy4y
LjU2CgpEbXl0cm8gTGFrdHl1c2hraW4gKDgpOgogIGRybS9hbWQvZGlzcGxheTogcmVtb3ZlIHVu
dXNlZCBjb2RlCiAgZHJtL2FtZC9kaXNwbGF5OiBzcGxpdCBkY24yMCBmYXN0IHZhbGlkYXRlIGlu
dG8gbW9yZSBmdW5jdGlvbnMKICBkcm0vYW1kL2Rpc3BsYXk6IGNvcnJlY3RseSBpbml0aWFsaXpl
IGRtbCBvZG0gdmFyaWFibGVzCiAgZHJtL2FtZC9kaXNwbGF5OiBtb3ZlIGRpc3BjbGsgdmNvIGZy
ZXEgdG8gY2xrIG1nciBiYXNlCiAgZHJtL2FtZC9kaXNwbGF5OiByZW1vdmUgdW5uZWNlc3Nhcnkg
YXNzZXJ0CiAgZHJtL2FtZC9kaXNwbGF5OiBmaXggbnVtYmVyIG9mIGRjbjIxIGRwbSBjbG9jayBs
ZXZlbHMKICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBlbWJlZGRlZCBmbGFnIHRvIGRtbAogIGRybS9h
bWQvZGlzcGxheTogZml4IGF2b2lkX3NwbGl0IGZvciBkY24yKyB2YWxpZGF0aW9uCgpFcmljIFlh
bmcgKDIpOgogIGRybS9hbWQvZGlzcGxheTogbW92ZSB3bSByYW5nZXMgcmVwb3J0aW5nIHRvIGVu
ZCBvZiBpbml0IGh3CiAgZHJtL2FtZC9kaXNwbGF5OiBmaXggaHViYnViIGRlYWRsaW5lIHByb2dy
YW1pbmcKCkpvcmRhbiBMYXphcmUgKDEpOgogIGRybS9hbWQvZGlzcGxheTogUmVtb3ZlIHN1cGVy
Zmx1b3VzIGFzc2VydAoKSm9zaHVhIEFiZXJiYWNrICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IEFw
cGx5IHZhY3RpdmUgZHJhbSBjbG9jayBjaGFuZ2Ugd29ya2Fyb3VuZCB0byBkY24yCiAgICBETUx2
MgoKSnVuIExlaSAoNCk6CiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgNTB1cyBidWZmZXIgYXMgV0Eg
Zm9yIHBzdGF0ZSBzd2l0Y2ggaW4gYWN0aXZlCiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgb2RtIHZp
c3VhbCBjb25maXJtCiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgZmxhZyB0byBhbGxvdyBkaWFnIHRv
IGZvcmNlIGVudW1lcmF0ZSBlZHAKICBkcm0vYW1kL2Rpc3BsYXk6IGRvIG5vdCBzeW5jaHJvbml6
ZSAiZHJyIiBkaXNwbGF5cwoKS3J1bm9zbGF2IEtvdmFjICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6
IE9ubHkgdXNlIEVFVEYgd2hlbiBtYXhDTCA+IG1heCBkaXNwbGF5CgpMZXdpcyBIdWFuZyAoMSk6
CiAgZHJtL2FtZC9kaXNwbGF5OiB0YWtlIHNpZ25hbCB0eXBlIGZyb20gbGluawoKTWljaGFlbCBT
dHJhdXNzICgzKToKICBkcm0vYW1kL2Rpc3BsYXk6IEZpeCBNUE8gJiBwaXBlIHNwbGl0IG9uIDMt
cGlwZSBkY24yeAogIGRybS9hbWQvZGlzcGxheTogUGFzc2l2ZSBEUC0+SERNSSBkb25nbGUgZGV0
ZWN0aW9uIGZpeAogIGRybS9hbWQvZGlzcGxheTogRGlzYWJsZSBmb3JjZV9zaW5nbGVfZGlzcF9w
aXBlX3NwbGl0IG9uIERDTjIrCgpOb2FoIEFicmFkamlhbiAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5
OiBNYWtlIGNsayBtZ3IgdGhlIG9ubHkgZHRvIHVwZGF0ZSBwb2ludAoKUGF1bCBIc2llaCAoMSk6
CiAgZHJtL2FtZC9kaXNwbGF5OiBhdWRpbyBlbmRwb2ludCBjYW5ub3Qgc3dpdGNoCgpSZXphIEFt
aW5pICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBjZW50ZXIgbW9kZSBmb3IgaW50ZWdlciBz
Y2FsaW5nIGluIERDCgpSb21hbiBMaSAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgZGVidWdm
cyBlbnRyeSBmb3IgcmVhZGluZyBwc3Igc3RhdGUKICBkcm0vYW1kL2Rpc3BsYXk6IEVuYWJsZSBQ
U1IKClN1bmcgTGVlICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IERvIG5vdCBjYWxsIHVwZGF0ZSBi
b3VuZGluZyBib3ggb24gZGMgY3JlYXRlCgpZb2dlc2ggTW9oYW4gTWFyaW11dGh1ICgxKToKICBk
cm0vYW1kL2Rpc3BsYXk6IG1hcCBUUkFOU01JVFRFUl9VTklQSFlfeCB0byBMSU5LX1JFR1NfeAoK
WW9uZ3FpYW5nIFN1biAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgdW5rbm93biBjbGsgc3Rh
dGUuCiAgZHJtL2FtZC9kaXNwbGF5OiBlbmFibGUgdm0gYnkgZGVmYXVsdCBmb3Igcm4uCgogLi4u
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTMzICsrKysrKysr
LQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jIHwgIDIxICsr
CiAuLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jICAgfCAgIDEgKwog
Li4uL2Rpc3BsYXkvZGMvY2xrX21nci9kY2UxMDAvZGNlX2Nsa19tZ3IuYyAgIHwgIDE0ICstCiAu
Li4vZGMvY2xrX21nci9kY2UxMTIvZGNlMTEyX2Nsa19tZ3IuYyAgICAgICAgfCAgIDQgKy0KIC4u
Li9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMTAvcnYxX2Nsa19tZ3IuYyAgICB8ICAxMCArLQogLi4u
L2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMgIHwgIDM4ICsrLQogLi4u
L2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jIHwgMTc4ICsrKysrKy0t
LS0tLQogLi4uL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5oIHwgICA3
IC0KIC4uLi9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMgICB8ICAgMiAr
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyAgICAgIHwgICA4ICst
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAxNDkgKysr
KysrKysrKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5jIHwg
IDI0ICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgfCAg
NTQgKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgIHwg
ICA5ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZGRjX3R5cGVzLmggfCAg
IDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jICB8ICAg
NSArLQogLi4uL2FtZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYyAgIHwgIDM3
ICsrLQogLi4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyAgIHwgIDEx
ICstCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jICAgfCAgMzcg
KystCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJjZS5jICAgfCAgMzcg
KystCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jICAgfCAgMzcg
KystCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMgfCAgMzcg
KystCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY21fY29tbW9uLmMgICAgfCAgMjIg
Ky0KIC4uLi9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8ICAgNCAr
CiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMgfCAgMjggKy0K
IC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyAgICB8ICAzMyArKy0K
IC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuaCAgICB8ICAgNCArLQog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMjYwICsrKysr
KysrKysrLS0tLS0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5oIHwgIDMxICsrKwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJj
ZS5jIHwgIDc4ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3Nt
dS5oICAgIHwgICA0ICstCiAuLi4vZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjAuYyAg
ICAgICAgfCAgIDMgKy0KIC4uLi9kYy9kbWwvZGNuMjAvZGlzcGxheV9tb2RlX3ZiYV8yMHYyLmMg
ICAgICB8ICAgMyArLQogLi4uL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfc3RydWN0
cy5oIHwgICAxICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEu
YyB8ICAgMyArCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmgg
fCAgIDEgKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMuaCAgIHwg
ICA0IC0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyLmggICB8ICAg
MyArLQogLi4uL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmggIHwgICAy
IC0KIC4uLi9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMgICB8ICA1MSAr
KystCiA0MSBmaWxlcyBjaGFuZ2VkLCAxMDc0IGluc2VydGlvbnMoKyksIDMxNyBkZWxldGlvbnMo
LSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
