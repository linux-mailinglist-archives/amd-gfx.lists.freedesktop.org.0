Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1581E7C897
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 18:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6E989FD4;
	Wed, 31 Jul 2019 16:26:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF6689FD4
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 16:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXJ92FL3gkgxF17doxArKcx5WSVrEtpkmXywgN+Fi6qvh61TboWg6avSOOozy7yJeTi0GZPaazMzjTulbkVdyKjGm5CZlDUI69rj03Xf5L20E8Tua2I1HovquOXre06NTvaE/VtYjvWsOe/hlorQa5rqwSTvvY0PoBP57OSRUMIPMj0+OHIGOjtNIC6MRTIoJn36663khR9Itj8FnumsNyf2WQW+MJ9MQwQhsTbZXEVw5jzWxRxDh6XIGevCnUUD72VcCrCo6Q7xDGnQxsrEbGi+rOtRjgGrUkyxjp2HswCYzDjvdgz/NMj3Rp7A+MfWlXfOWi3Dn14Npkbx+KH4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjHUex1Tghuf6fT6syodvvdcYhWO3Ud0+/ySOct6clU=;
 b=k8wmQrA9RjsEzTngzxOHcN6swUrxdgT/6C69tNgdoj1lUQhHUsP0lgbrWHhiqvbTNuxNA9TQDksyZDISCtYLkXaUJmpvgTVfikqdkV2pSCWxZL1aX/UREqNzsXqVYacZeP6GTrXYxIRV740y11Jh2x2AquAyGRDy7+X25fpoEt40FFCUsB2E4T4Ttb/qZbLWRTDqTFuwFEKsz/sAwQ8d/SJvefqYc7Ast1W3xCv+iw8K51KdM/tDzRS3Hupdp2VjfzD274/oPgnupIDA1edDPNJrxesb1+ZDZq4tJhYKXiAuclaW2L/0mJMNPTu91gDBHq0T9TCk7vg+HNoOHSlMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:208:a8::27)
 by MN2PR12MB3517.namprd12.prod.outlook.com (2603:10b6:208:ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Wed, 31 Jul
 2019 16:26:17 +0000
Received: from CO1NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by MN2PR12CA0014.outlook.office365.com
 (2603:10b6:208:a8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Wed, 31 Jul 2019 16:26:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT036.mail.protection.outlook.com (10.152.80.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Wed, 31 Jul 2019 16:26:17 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 31 Jul 2019
 11:26:16 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/display: Don't replace the dc_state for fast
 updates
Date: Wed, 31 Jul 2019 12:26:04 -0400
Message-ID: <20190731162604.28509-3-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731162604.28509-1-nicholas.kazlauskas@amd.com>
References: <20190731162604.28509-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(2980300002)(428003)(189003)(199004)(51416003)(486006)(48376002)(6666004)(356004)(86362001)(305945005)(70586007)(50226002)(47776003)(5660300002)(2906002)(15650500001)(53936002)(70206006)(126002)(476003)(36756003)(4326008)(44832011)(966005)(446003)(1076003)(11346002)(68736007)(2616005)(6916009)(8936002)(336012)(316002)(478600001)(76176011)(81166006)(54906003)(6306002)(8676002)(81156014)(426003)(50466002)(16586007)(53416004)(14444005)(186003)(26005)(2351001)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3517; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5be9b907-aa42-462c-6094-08d715d3d04a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3517; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3517:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <MN2PR12MB3517587E46D6317532E551F8ECDF0@MN2PR12MB3517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 011579F31F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: WohxEfaj0O84gDmqU0+VOzphaDM2AlE9+iAgCqrlB05ci22oDloSbqeiHJKaKi09BD2xQlO9eoEhZX6YJUMGBOjWQIYaZK1iYVepRY2ZTBlP6gIYuwKqa0nqhFhJQf7EGV0XK/ugZJWZAZXsWEGoOuSEtaEQzIBLw6z3n5KPMpDaMmXKJs3dgb9LGOBQ+PYYOZ4o2JZdt9y8+Z6yJ5+nFGiDp/11ZDsGt8i3uEse+7mD7EAGJJCcYfF9lJAfxs+kgWeZK5IRs85Pl8yVA2mZeFuswwgOb1mKxwutJlTz8oZrD5z0ZqlhfHkpwn7lOIxHp+9V2xU10nwS+F1Nei5TEFm95utH9ZOneMz5i/FBKt32i5xYzTK3l3eKPYVnisa85Zo7kjq7ShWRgw0ASmYI+VN9W6S/5OIJMjXQiaMvNsk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 16:26:17.1102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be9b907-aa42-462c-6094-08d715d3d04a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3517
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjHUex1Tghuf6fT6syodvvdcYhWO3Ud0+/ySOct6clU=;
 b=iyNUElJbrKqfRjbFkQStHge57gXi6A6oJYvISrpYucz+JmbSUJ/+t5YEWsBBoLGGE7cb21edZmwrFe5+XckArvurA0FQCs0CwSNjhugRQvRlWc+i3z54hQG1+M27/rJRInH/i4zdqHa/arvO2t4jaLxjaIdaH0nLkMccW1yj5CI=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <david.francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KRFJNIHByaXZhdGUgb2JqZWN0cyBoYXZlIG5vIGh3X2RvbmUvZmxpcF9kb25lIGZlbmNp
bmcgbWVjaGFuaXNtIG9uIHRoZWlyCm93biBhbmQgY2Fubm90IGJlIHVzZWQgdG8gc2VxdWVuY2Ug
Y29tbWl0cyBhY2NvcmRpbmdseS4KCldoZW4gaXNzdWluZyBjb21taXRzIHRoYXQgZG9uJ3QgdG91
Y2ggdGhlIHNhbWUgc2V0IG9mIGhhcmR3YXJlIHJlc291cmNlcwpsaWtlIHBhZ2UtZmxpcHMgb24g
ZGlmZmVyZW50IENSVENzIHdlIGNhbiBydW4gaW50byB0aGUgaXNzdWUgYmVsb3cKYmVjYXVzZSBv
ZiB0aGlzOgoKMS4gQ2xpZW50IHJlcXVlc3RzIG5vbi1ibG9ja2luZyBDb21taXQgIzEsIGhhcyBh
IG5ldyBkY19zdGF0ZSAjMSwKc3RhdGUgaXMgc3dhcHBlZCwgY29tbWl0IHRhaWwgaXMgZGVmZXJy
ZWQgdG8gd29yayBxdWV1ZQoKMi4gQ2xpZW50IHJlcXVlc3RzIG5vbi1ibG9ja2luZyBDb21taXQg
IzIsIGhhcyBhIG5ldyBkY19zdGF0ZSAjMiwKc3RhdGUgaXMgc3dhcHBlZCwgY29tbWl0IHRhaWwg
aXMgZGVmZXJyZWQgdG8gd29yayBxdWV1ZQoKMy4gQ29tbWl0ICMyIHdvcmsgc3RhcnRzLCBjb21t
aXQgdGFpbCBmaW5pc2hlcywKYXRvbWljIHN0YXRlIGlzIGNsZWFyZWQsIGRjX3N0YXRlICMxIGlz
IGZyZWVkCgo0LiBDb21taXQgIzEgd29yayBzdGFydHMsCmNvbW1pdCB0YWlsIGVuY291bnRlcnMg
bnVsbCBwb2ludGVyIGRlcmVmIG9uIGRjX3N0YXRlICMxCgpJbiBvcmRlciB0byBjaGFuZ2UgdGhl
IERDIHN0YXRlIGFzIGluIHRoZSBwcml2YXRlIG9iamVjdCB3ZSBuZWVkIHRvCmVuc3VyZSB0aGF0
IHdlIHdhaXQgZm9yIGFsbCBvdXRzdGFuZGluZyBjb21taXRzIHRvIGZpbmlzaCBhbmQgdGhhdAph
bnkgb3RoZXIgcGVuZGluZyBjb21taXRzIG11c3Qgd2FpdCBmb3IgdGhlIGN1cnJlbnQgb25lIHRv
IGZpbmlzaCBhcwp3ZWxsLgoKV2UgZG8gdGhpcyBmb3IgTUVESVVNIGFuZCBGVUxMIHVwZGF0ZXMu
IEJ1dCBub3QgZm9yIEZBU1QgdXBkYXRlcywgbm9yCndvdWxkIHdlIHdhbnQgdG8gc2luY2UgaXQg
d291bGQgY2F1c2Ugc3R1dHRlcmluZyBmcm9tIHRoZSBkZWxheXMuCgpGQVNUIHVwZGF0ZXMgdGhh
dCBnbyB0aHJvdWdoIGRtX2RldGVybWluZV91cGRhdGVfdHlwZV9mb3JfY29tbWl0IGFsd2F5cwpj
cmVhdGUgYSBuZXcgZGNfc3RhdGUgYW5kIGxvY2sgdGhlIERSTSBwcml2YXRlIG9iamVjdCBpZiB0
aGVyZSBhcmUKYW55IGNoYW5nZWQgcGxhbmVzLgoKV2UgbmVlZCB0aGUgb2xkIHN0YXRlIHRvIHZh
bGlkYXRlLCBidXQgd2UgZG9uJ3QgYWN0dWFsbHkgbmVlZCB0aGUgbmV3CnN0YXRlIGhlcmUuCgpb
SG93XQpJZiB0aGUgY29tbWl0IGlzbid0IGEgZnVsbCB1cGRhdGUgdGhlbiB0aGUgdXNlIGFmdGVy
IGZyZWUgY2FuIGJlCnJlc29sdmVkIGJ5IHNpbXBseSBkaXNjYXJkaW5nIHRoZSBuZXcgc3RhdGUg
ZW50aXJlbHkgYW5kIHJldGFpbmluZwp0aGUgZXhpc3Rpbmcgb25lIGluc3RlYWQuCgpXaXRoIHRo
aXMgY2hhbmdlIHRoZSBzZXF1ZW5jZSBhYm92ZSBjYW4gYmUgcmVleGFtaW5lZC4gQ29tbWl0ICMy
IHdpbGwKc3RpbGwgZnJlZSBDb21taXQgIzEncyByZWZlcmVuY2UsIGJ1dCBiZWZvcmUgdGhpcyBo
YXBwZW5zIHdlIGFjdHVhbGx5CmFkZGVkIGFuIGFkZGl0aW9uYWwgcmVmZXJlbmNlIGFzIHBhcnQg
b2YgQ29tbWl0ICMyLgoKSWYgYW4gdXBkYXRlIGNvbWVzIGluIGR1cmluZyB0aGlzIHRoYXQgbmVl
ZHMgdG8gY2hhbmdlIHRoZSBkY19zdGF0ZQppdCB3aWxsIG5lZWQgdG8gd2FpdCBvbiBDb21taXQg
IzEgYW5kIENvbW1pdCAjMiB0byBmaW5pc2guIFRoZW4gaXQnbGwKc3dhcCB0aGUgc3RhdGUsIGZp
bmlzaCB0aGUgd29yayBpbiBjb21taXQgdGFpbCBhbmQgZHJvcCB0aGUgbGFzdApyZWZlcmVuY2Ug
b24gQ29tbWl0ICMyJ3MgZGNfc3RhdGUuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgpDYzogRGF2aWQgRnJhbmNpcyA8ZGF2aWQuZnJhbmNpc0BhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Ci0t
LQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRl
eCA0YzkwNjYyZTlmYTIuLmZlNTI5MWIxNjE5MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC03Mjg4LDYgKzcyODgsMjkgQEAg
c3RhdGljIGludCBhbWRncHVfZG1fYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CiAJCQlyZXQgPSAtRUlOVkFMOwogCQkJZ290byBmYWlsOwogCQl9CisJfSBlbHNlIHsKKwkJLyoK
KwkJICogVGhlIGNvbW1pdCBpcyBhIGZhc3QgdXBkYXRlLiBGYXN0IHVwZGF0ZXMgc2hvdWxkbid0
IGNoYW5nZQorCQkgKiB0aGUgREMgY29udGV4dCwgYWZmZWN0IGdsb2JhbCB2YWxpZGF0aW9uLCBh
bmQgY2FuIGhhdmUgdGhlaXIKKwkJICogY29tbWl0IHdvcmsgZG9uZSBpbiBwYXJhbGxlbCB3aXRo
IG90aGVyIGNvbW1pdHMgbm90IHRvdWNoaW5nCisJCSAqIHRoZSBzYW1lIHJlc291cmNlLiBJZiB3
ZSBoYXZlIGEgbmV3IERDIGNvbnRleHQgYXMgcGFydCBvZgorCQkgKiB0aGUgRE0gYXRvbWljIHN0
YXRlIGZyb20gdmFsaWRhdGlvbiB3ZSBuZWVkIHRvIGZyZWUgaXQgYW5kCisJCSAqIHJldGFpbiB0
aGUgZXhpc3Rpbmcgb25lIGluc3RlYWQuCisJCSAqLworCQlzdHJ1Y3QgZG1fYXRvbWljX3N0YXRl
ICpuZXdfZG1fc3RhdGUsICpvbGRfZG1fc3RhdGU7CisKKwkJbmV3X2RtX3N0YXRlID0gZG1fYXRv
bWljX2dldF9uZXdfc3RhdGUoc3RhdGUpOworCQlvbGRfZG1fc3RhdGUgPSBkbV9hdG9taWNfZ2V0
X29sZF9zdGF0ZShzdGF0ZSk7CisKKwkJaWYgKG5ld19kbV9zdGF0ZSAmJiBvbGRfZG1fc3RhdGUp
IHsKKwkJCWlmIChuZXdfZG1fc3RhdGUtPmNvbnRleHQpCisJCQkJZGNfcmVsZWFzZV9zdGF0ZShu
ZXdfZG1fc3RhdGUtPmNvbnRleHQpOworCisJCQluZXdfZG1fc3RhdGUtPmNvbnRleHQgPSBvbGRf
ZG1fc3RhdGUtPmNvbnRleHQ7CisKKwkJCWlmIChvbGRfZG1fc3RhdGUtPmNvbnRleHQpCisJCQkJ
ZGNfcmV0YWluX3N0YXRlKG9sZF9kbV9zdGF0ZS0+Y29udGV4dCk7CisJCX0KIAl9CiAKIAkvKiBN
dXN0IGJlIHN1Y2Nlc3MgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
