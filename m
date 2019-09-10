Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE2AF169
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4ED6E956;
	Tue, 10 Sep 2019 19:04:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F26E959
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVc6D890iaUdO1aFBoNB1POAR8gQvJX+T+bucptfi3P319qpafvtT8lXp8SgTIBXx+uqm9a9pfguODcVQbLQy1cLlb3hTGsGod42OAlK5UA/UHyJ9YWt5eHF4rl3USbdEuiF4XF5PiR8Q2knV+y0E6cigwTGBeQ1gu+Qy4ISSkVShd75rOavl2qLY3u1dCDE/L2M7QkirsTKfp6YHgoNTPH+bswUVT1kUVDZdc4T4YbFAyDQxFuuB9b2bGsUV3DzwTcOlE/2GGGac+xnlvAYgYudOsvnX6PrweSPeUQdcvTDgyds+wYgCVzOqQMaan34l1S3naS10FWRGjXfU4WjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOK7HvKKSOwZyWAb05jhdqvPsRC+twXrRQZTerhTz80=;
 b=QzTZu5C4TKXdVwtM4+sTdFtH7/gVdnrtxQWW12sdmsz+DKBwwXco01bRit/a7SUcJLJeUvtckZbLvdbOs6Zzsh3Q3xXoSVbeK0cJGkFQ6q3tWPXZajl0OmLoauz1DU1Ieyz1dW1WeTGD8Lf6zCzuzNbsyKjMJbyVAliR19Q2BK+VtLVKzWHa+mtoWuUaTpxameQCAOQQDulSWzjTIp55tmzPU8Ge2NT/gNr9Lou/Qbm9GejA3Ps6moswvTHUtEnWpGeK+WhBHz9CYq9Lj0OSW0wI/NXGhqU4+IMLdUGWtlFCWW8R1ERkUUMbVvrEnLLuQoIpkeBkHEG2HTMCbw9rbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by BY5PR12MB4147.namprd12.prod.outlook.com
 (2603:10b6:a03:205::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Tue, 10 Sep
 2019 19:04:34 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:34 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:30 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/20] drm/hdcp: update content protection property with uevent
Date: Tue, 10 Sep 2019 15:04:09 -0400
Message-ID: <20190910190422.794-8-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(316002)(8936002)(446003)(476003)(11346002)(2616005)(81156014)(81166006)(4326008)(26005)(126002)(186003)(6306002)(53936002)(426003)(6916009)(36756003)(76176011)(51416003)(486006)(336012)(50466002)(48376002)(5660300002)(50226002)(47776003)(7696005)(70206006)(16586007)(1076003)(70586007)(15650500001)(14444005)(5024004)(86362001)(53416004)(2351001)(305945005)(6666004)(8676002)(356004)(478600001)(966005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4147; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e4b7e8b-506f-456b-ea5c-08d73621b80c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BY5PR12MB4147; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB4147:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <BY5PR12MB4147B69C9670A94D15AB3DD8F9B60@BY5PR12MB4147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9fr1MVbGniehzSB7nIF6bBZcBFcuIQ/mMZPBMUoKu7TTcr1893Fk9omeo2fAHstxbKiW9rHVFUnz9WIbQB/RNg5Egdq70vYzQw+ZliuLgo1f3G8zjY2lOL3OVelbIImmO3bzvbblFV2fd+MVKfjTUQbnn0aVtRlRwv8OTWQRsoO2BanrSzJlsqOi2eRL9t0Bj0Ai/HLmP+QFpcHb+UoXAyTwEEYG3+uQFqPSY13SEuQWTy5pdXV8zKYO0xkMOGQvpaXWYUK4DY9PG6nxiZOS+6oEcSpu6qC6/gy4AV+oNOf/NzT5qm6sGTB2NB/zc6sOas/Xj/i3xCGA9IorC7+eQS1t1eRMdUhUBmm5x8PsIIIALtKEQKMolRbOtF4TO17330B3euTrhvEGoEvyXteBqZxy+iiRT/OuhcQmKr9BRXY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:34.4208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4b7e8b-506f-456b-ea5c-08d73621b80c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOK7HvKKSOwZyWAb05jhdqvPsRC+twXrRQZTerhTz80=;
 b=z0pJpEcF/srasuKVqveWTs031nBx5VBjFDLLF2VUqnrdMaSaxs7OYmBVJ07bCOjhOarym4Fk+dnOqkvkCrSqxA2w9uhXItTB3MuYv9FXBu+fka99235wpwED+p1I9wcCwkoE+ak/5IHiDpgGztzvjj8jqbN5XD4rZkpaPyjRT6k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Ramalingam C <ramalingam.c@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgoKZHJtIGZ1bmN0aW9u
IGlzIGRlZmluZWQgYW5kIGV4cG9ydGVkIHRvIHVwZGF0ZSBhIGNvbm5lY3RvcidzCmNvbnRlbnQg
cHJvdGVjdGlvbiBwcm9wZXJ0eSBzdGF0ZSBhbmQgdG8gZ2VuZXJhdGUgYSB1ZXZlbnQgYWxvbmcK
d2l0aCBpdC4KClBla2thIGhhdmUgY29tcGxldGVkIHRoZSBXZXN0b24gRFJNLWJhY2tlbmQgcmV2
aWV3IGluCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dlc3Rvbi9tZXJn
ZV9yZXF1ZXN0cy80OAphbmQgdGhlIFVBUEkgZm9yIEhEQ1AgMi4yIGxvb2tzIGdvb2QuCgpUaGUg
dXNlcnNwYWNlIGlzIGFjY2VwdGVkIGluIFdlc3Rvbi4KCnYyOgogIFVwZGF0ZSBvbmx5IHdoZW4g
c3RhdGUgaXMgZGlmZmVyZW50IGZyb20gb2xkIG9uZS4KdjM6CiAgS0RvYyBpcyBhZGRlZCBbRGFu
aWVsXQp2NDoKICBLRG9jIGlzIGV4dGVuZGVkIGJpdCBtb3JlIFtwZWtrYV0KdjU6CiAgVWV2ZW50
IHVzYWdlIGlzIGRvY3VtZW50ZWQgYXQga2RvYyBvZiAiQ29udGVudCBQcm90ZWN0aW9uIiBhbHNv
CiAgW3Bla2thXQoKU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KQWNrZWQtYnk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEuY29t
PgpBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KTGluazogaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMyMDk2My8/c2VyaWVzPTU3MjMy
JnJldj0xNAotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCAxNyArKysrKysr
KysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMgICAgICB8IDM0ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2hkY3AuaCAgICAgICAg
ICB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKaW5kZXggM2IwOTEwYjM2ZWY1Li4zYTBjYWNiNzEy
MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpAQCAtOTUxLDEwICs5NTEsMTkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgaGRtaV9jb2xvcnNwYWNlc1tdID0gewog
ICoJLSBJZiB0aGUgc3RhdGUgaXMgREVTSVJFRCwga2VybmVsIHNob3VsZCBhdHRlbXB0IHRvIHJl
LWF1dGhlbnRpY2F0ZSB0aGUKICAqCSAgbGluayB3aGVuZXZlciBwb3NzaWJsZS4gVGhpcyBpbmNs
dWRlcyBhY3Jvc3MgZGlzYWJsZS9lbmFibGUsIGRwbXMsCiAgKgkgIGhvdHBsdWcsIGRvd25zdHJl
YW0gZGV2aWNlIGNoYW5nZXMsIGxpbmsgc3RhdHVzIGZhaWx1cmVzLCBldGMuLgotICoJLSBVc2Vy
c3BhY2UgaXMgcmVzcG9uc2libGUgZm9yIHBvbGxpbmcgdGhlIHByb3BlcnR5IHRvIGRldGVybWlu
ZSB3aGVuCi0gKgkgIHRoZSB2YWx1ZSB0cmFuc2l0aW9ucyBmcm9tIEVOQUJMRUQgdG8gREVTSVJF
RC4gVGhpcyBzaWduaWZpZXMgdGhlIGxpbmsKLSAqCSAgaXMgbm8gbG9uZ2VyIHByb3RlY3RlZCBh
bmQgdXNlcnNwYWNlIHNob3VsZCB0YWtlIGFwcHJvcHJpYXRlIGFjdGlvbgotICoJICAod2hhdGV2
ZXIgdGhhdCBtaWdodCBiZSkuCisgKgktIEtlcm5lbCBzZW5kcyB1ZXZlbnQgd2l0aCB0aGUgY29u
bmVjdG9yIGlkIGFuZCBwcm9wZXJ0eSBpZCB0aHJvdWdoCisgKgkgIEBkcm1faGRjcF91cGRhdGVf
Y29udGVudF9wcm90ZWN0aW9uLCB1cG9uIGJlbG93IGtlcm5lbCB0cmlnZ2VyZWQKKyAqCSAgc2Nl
bmFyaW9zOgorICoJCURFU0lSRUQgLT4gRU5BQkxFRAkoYXV0aGVudGljYXRpb24gc3VjY2VzcykK
KyAqCQlFTkFCTEVEIC0+IERFU0lSRUQJKHRlcm1pbmF0aW9uIG9mIGF1dGhlbnRpY2F0aW9uKQor
ICoJLSBQbGVhc2Ugbm90ZSBubyB1ZXZlbnRzIGZvciB1c2Vyc3BhY2UgdHJpZ2dlcmVkIHByb3Bl
cnR5IHN0YXRlIGNoYW5nZXMsCisgKgkgIHdoaWNoIGNhbid0IGZhaWwgc3VjaCBhcworICoJCURF
U0lSRUQvRU5BQkxFRCAtPiBVTkRFU0lSRUQKKyAqCQlVTkRFU0lSRUQgLT4gREVTSVJFRAorICoJ
LSBVc2Vyc3BhY2UgaXMgcmVzcG9uc2libGUgZm9yIHBvbGxpbmcgdGhlIHByb3BlcnR5IG9yIGxp
c3RlbiB0byB1ZXZlbnRzCisgKgkgIHRvIGRldGVybWluZSB3aGVuIHRoZSB2YWx1ZSB0cmFuc2l0
aW9ucyBmcm9tIEVOQUJMRUQgdG8gREVTSVJFRC4KKyAqCSAgVGhpcyBzaWduaWZpZXMgdGhlIGxp
bmsgaXMgbm8gbG9uZ2VyIHByb3RlY3RlZCBhbmQgdXNlcnNwYWNlIHNob3VsZAorICoJICB0YWtl
IGFwcHJvcHJpYXRlIGFjdGlvbiAod2hhdGV2ZXIgdGhhdCBtaWdodCBiZSkuCiAgKgogICogSERD
UCBDb250ZW50IFR5cGU6CiAgKglUaGlzIEVudW0gcHJvcGVydHkgaXMgdXNlZCBieSB0aGUgdXNl
cnNwYWNlIHRvIGRlY2xhcmUgdGhlIGNvbnRlbnQgdHlwZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9oZGNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYwppbmRleCA3NTQw
MjQ2MzQ2NmIuLjFlMmE1MGJjYWI3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9o
ZGNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMKQEAgLTM3Miw2ICszNzIsMTAg
QEAgRFJNX0VOVU1fTkFNRV9GTihkcm1fZ2V0X2hkY3BfY29udGVudF90eXBlX25hbWUsCiAgKgog
ICogVGhlIGNvbnRlbnQgcHJvdGVjdGlvbiB3aWxsIGJlIHNldCB0byAmZHJtX2Nvbm5lY3Rvcl9z
dGF0ZS5jb250ZW50X3Byb3RlY3Rpb24KICAqCisgKiBXaGVuIGtlcm5lbCB0cmlnZ2VyZWQgY29u
dGVudCBwcm90ZWN0aW9uIHN0YXRlIGNoYW5nZSBsaWtlIERFU0lSRUQtPkVOQUJMRUQKKyAqIGFu
ZCBFTkFCTEVELT5ERVNJUkVELCB3aWxsIHVzZSBkcm1faGRjcF91cGRhdGVfY29udGVudF9wcm90
ZWN0aW9uKCkgdG8gdXBkYXRlCisgKiB0aGUgY29udGVudCBwcm90ZWN0aW9uIHN0YXRlIG9mIGEg
Y29ubmVjdG9yLgorICoKICAqIFJldHVybnM6CiAgKiBaZXJvIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZl
IGVycm5vIG9uIGZhaWx1cmUuCiAgKi8KQEAgLTQxMiwzICs0MTYsMzMgQEAgaW50IGRybV9jb25u
ZWN0b3JfYXR0YWNoX2NvbnRlbnRfcHJvdGVjdGlvbl9wcm9wZXJ0eSgKIAlyZXR1cm4gMDsKIH0K
IEVYUE9SVF9TWU1CT0woZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfY29udGVudF9wcm90ZWN0aW9uX3By
b3BlcnR5KTsKKworLyoqCisgKiBkcm1faGRjcF91cGRhdGVfY29udGVudF9wcm90ZWN0aW9uIC0g
VXBkYXRlcyB0aGUgY29udGVudCBwcm90ZWN0aW9uIHN0YXRlCisgKiBvZiBhIGNvbm5lY3Rvcgor
ICoKKyAqIEBjb25uZWN0b3I6IGRybV9jb25uZWN0b3Igb24gd2hpY2ggY29udGVudCBwcm90ZWN0
aW9uIHN0YXRlIG5lZWRzIGFuIHVwZGF0ZQorICogQHZhbDogTmV3IHN0YXRlIG9mIHRoZSBjb250
ZW50IHByb3RlY3Rpb24gcHJvcGVydHkKKyAqCisgKiBUaGlzIGZ1bmN0aW9uIGNhbiBiZSB1c2Vk
IGJ5IGRpc3BsYXkgZHJpdmVycywgdG8gdXBkYXRlIHRoZSBrZXJuZWwgdHJpZ2dlcmVkCisgKiBj
b250ZW50IHByb3RlY3Rpb24gc3RhdGUgY2hhbmdlcyBvZiBhIGRybV9jb25uZWN0b3Igc3VjaCBh
cyBERVNJUkVELT5FTkFCTEVECisgKiBhbmQgRU5BQkxFRC0+REVTSVJFRC4gTm8gdWV2ZW50IGZv
ciBERVNJUkVELT5VTkRFU0lSRUQgb3IgRU5BQkxFRC0+VU5ERVNJUkVELAorICogYXMgdXNlcnNw
YWNlIGlzIHRyaWdnZXJpbmcgc3VjaCBzdGF0ZSBjaGFuZ2UgYW5kIGtlcm5lbCBwZXJmb3JtcyBp
dCB3aXRob3V0CisgKiBmYWlsLlRoaXMgZnVuY3Rpb24gdXBkYXRlIHRoZSBuZXcgc3RhdGUgb2Yg
dGhlIHByb3BlcnR5IGludG8gdGhlIGNvbm5lY3RvcidzCisgKiBzdGF0ZSBhbmQgZ2VuZXJhdGUg
YW4gdWV2ZW50IHRvIG5vdGlmeSB0aGUgdXNlcnNwYWNlLgorICovCit2b2lkIGRybV9oZGNwX3Vw
ZGF0ZV9jb250ZW50X3Byb3RlY3Rpb24oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwK
KwkJCQkJdTY0IHZhbCkKK3sKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5k
ZXY7CisJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKnN0YXRlID0gY29ubmVjdG9yLT5zdGF0
ZTsKKworCVdBUk5fT04oIWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgmZGV2LT5tb2RlX2NvbmZpZy5j
b25uZWN0aW9uX211dGV4KSk7CisJaWYgKHN0YXRlLT5jb250ZW50X3Byb3RlY3Rpb24gPT0gdmFs
KQorCQlyZXR1cm47CisKKwlzdGF0ZS0+Y29udGVudF9wcm90ZWN0aW9uID0gdmFsOworCWRybV9z
eXNmc19jb25uZWN0b3Jfc3RhdHVzX2V2ZW50KGNvbm5lY3RvciwKKwkJCQkgZGV2LT5tb2RlX2Nv
bmZpZy5jb250ZW50X3Byb3RlY3Rpb25fcHJvcGVydHkpOworfQorRVhQT1JUX1NZTUJPTChkcm1f
aGRjcF91cGRhdGVfY29udGVudF9wcm90ZWN0aW9uKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9oZGNwLmggYi9pbmNsdWRlL2RybS9kcm1faGRjcC5oCmluZGV4IDgyNDQ3YWY5OGFhMi4u
MDZhMTEyMDJhMDk3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1faGRjcC5oCisrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9oZGNwLmgKQEAgLTI5Miw2ICsyOTIsOCBAQCBib29sIGRybV9oZGNwX2No
ZWNrX2tzdnNfcmV2b2tlZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCSB1OCAqa3N2cywg
dTMyIGtzdl9jb3VudCk7CiBpbnQgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfY29udGVudF9wcm90ZWN0
aW9uX3Byb3BlcnR5KAogCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGhk
Y3BfY29udGVudF90eXBlKTsKK3ZvaWQgZHJtX2hkY3BfdXBkYXRlX2NvbnRlbnRfcHJvdGVjdGlv
bihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAorCQkJCQl1NjQgdmFsKTsKIAogLyog
Q29udGVudCBUeXBlIGNsYXNzaWZpY2F0aW9uIGZvciBIRENQMi4yIHZzIG90aGVycyAqLwogI2Rl
ZmluZSBEUk1fTU9ERV9IRENQX0NPTlRFTlRfVFlQRTAJCTAKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
