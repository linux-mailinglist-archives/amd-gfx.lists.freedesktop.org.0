Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46161AF19F
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED236E987;
	Tue, 10 Sep 2019 19:06:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF696E96E
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7Lmo7Jqb3ivxJGreqasMY9Mry/iag5sG3QPxeDryp5qrR+h/VpDoe6TyxUfSPI4Qb4B1JBNEfffBrnILw54krG6+8P0iQDJFUFtX85w3NUiVU5f3E/Hku/aWlUkRfzZTWcXUCbgEyMqhAFN8k7Sh3dvxoVwIAY72ed3Z3VZK+g4aNpa9auPivZkPswqEf1g44hbrssVUuwKArSYzPoT7x8fX18B0H2u8SuCcfkDndB5HNyuridomVwoyaG8UemxqXECpHD21XqTuXQBMTWRrcf7WCZ1edL8KSvoNBYjgwDdf44HqTd5uv9aggK/ue8VMFzIzM2rpOklWLrhCkY5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOK7HvKKSOwZyWAb05jhdqvPsRC+twXrRQZTerhTz80=;
 b=XXzmzA8X7rgd7/G0szBiKSWcjZDeXpUrevEz7VZ48LGYtVipZpmJuP9GrO+4R1VMCTsOVhUQcY9E2KcbibwE9P7u1GVKgvo2UuEusIw2PRztiz44m4SMUvsQQZoX1GBlWfgpu71bYRq4mlMzREAKymcMyBNxgnHSyrWjKsP9K+/K4AGgGUlUyQJ/4cIkXnLVNz7zXRoJfrHoefEs74YXUABq17fhEF4kg0HLh4D8Ruwx90TMyccZDY3SJMx93eXO+MWe06LewvrwYe0USX3SKmLUdGQhov2GfjOYa/4PZEcHsR1LBvxkgM10GlqNS+jK7XRb+JbbduhD6YhpgHU8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:301:4a::25) by DM5PR1201MB0250.namprd12.prod.outlook.com
 (2603:10b6:4:54::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:06:20 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by MWHPR1201CA0015.outlook.office365.com
 (2603:10b6:301:4a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:20 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:16 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/20] drm/hdcp: update content protection property with uevent
Date: Tue, 10 Sep 2019 15:05:41 -0400
Message-ID: <20190910190554.1539-8-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(966005)(4326008)(6916009)(53416004)(81156014)(8936002)(1076003)(51416003)(7696005)(14444005)(48376002)(50226002)(76176011)(5024004)(50466002)(2351001)(305945005)(478600001)(70586007)(36756003)(15650500001)(8676002)(186003)(126002)(47776003)(336012)(11346002)(446003)(426003)(6306002)(53936002)(476003)(2616005)(486006)(6666004)(26005)(86362001)(16586007)(81166006)(2906002)(316002)(70206006)(356004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0250; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31ff9490-dd08-4134-d5e1-08d73621f72d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB0250; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0250:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02504968A690E1E2F4E53CC8F9B60@DM5PR1201MB0250.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OFwDJrQWeccWo5mOIRXz6aTrFNvl8OUIkGW20qyKA9US2ZVuTP2/vYVb/YSfB20JD4Z/Azi356jQ/7q9v409QEq6uzjCDno29620tOrfN8PCopttCQwwC033hm3oHfl+OoaVdE5UrNVRZ7/lYOMIFZnYn8uCuvXPx9aPPNvyekBrcQDhhuylYVNL9aXVCI8SyKHOB5Ynu1cZLxtsjWVMZBKZzMXQaRVHvNp3G9ioTL3Hh9qZo4rx7Kb/RpcGvfrN1CR70FBfaTu/o5w512pOOyqm2RgaL2246gCtmL0yrsyTJeoov2ZrhQHTqojXHXolYo9FXbeiwGNXMJ4jgEX+crl5+/NqEr624+P0GV38y6hgkr3miBUl3+ouIS2Z0S8Mo7U9bJAjeMqFj6EltuLs+zM9vFRBK4ijzvDJuVe9em4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:20.3380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ff9490-dd08-4134-d5e1-08d73621f72d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOK7HvKKSOwZyWAb05jhdqvPsRC+twXrRQZTerhTz80=;
 b=h0IoD5haJoGR6axCDpnECZaTzfpJxjUgj79A00n/wOVG3425PBJf/eLXsa8Fx3NBJHEcDrRSKfEa2DLNvnG346+ScZFUoe+QE9/1GP5XqLx/+Lso3IeBJW2F5TKHvYYwT6i1QX4ixV3KJQ/gjXoDYtLD+jpCY3y+wTpStLeKp8U=
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
