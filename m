Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39EF8980D
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 09:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855C889BF6;
	Mon, 12 Aug 2019 07:44:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253F489BF6
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 07:44:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNQ5tzQ6dQl/qu5VfHG6roIm7Nq11ZHDmQnzFsJAR3P0anJ2CR72cHd7cM1+mAKKqlvzo/Ue9EKn2jbr1yymKT++z0KrcPu9vT7J/p08ftHbZNy7YCtQsIqReXds05ym/BZpv7gOzrA/M4YzYULmpzieKUS3zrDibGTMnyehA5dSIrLfDoUd3lJSdlDDqwl2w/9euzw6mVYbxbe/Oni88wy58yfFJYHNH5b8Js/WF5vxf28mgXpSaaVGvr2m1Ly7m1ODIvozh54aiByOrVilECXMq62GGpvugaqEixugcERKq3kJ4eg3nuGA6GFoIc7jcRAJAjJYy7RtG3cjeYmUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4oW2S3EObLX6cMU6lSobHzZiIiGtmsRJyLdjAHQ+3U=;
 b=Hup4lqA8F+Q4MY4FFI4lcO2yQ3uzH3Ko9W27upHbNemdqnjZo7MdIYzEBJ6wMkCsrTALUwZ+cESFRIFsjdvJu8PVNYZuiUcX1QiFaHsULCwJOACQ93oKX5zduPAYdbzk9+IPdb8pA8g7iC4nUxg55EA35t/Q6rRbm8qF+nfa6z0E3bHQpOYRVStpwdjZY3tgV8589dGgxrFFUi40r9pRplcpc/jbBpHUNMYBz5K0yfHwAfqp1xmLvLKSTnANwZqCZoic+sD6EG9IpWFUt3ulmP0K/OJJhKFZ3Jk2zy0OoWlPTsm0mz8fuC8xhWBtp8jKqPpludhItMma5wtxflixRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0080.namprd12.prod.outlook.com (2603:10b6:0:57::24) by
 SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:70::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Mon, 12 Aug 2019 07:42:48 +0000
Received: from CO1NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0080.outlook.office365.com
 (2603:10b6:0:57::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Mon, 12 Aug 2019 07:42:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT046.mail.protection.outlook.com (10.152.81.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Mon, 12 Aug 2019 07:42:47 +0000
Received: from emily-build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 12 Aug 2019 02:42:46 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] SWDEV-197284 - drm/amdgpu: Only use the peek function in
 productor side is not correct
Date: Mon, 12 Aug 2019 15:42:42 +0800
Message-ID: <1565595762-8141-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(336012)(486006)(356004)(6666004)(2351001)(478600001)(53936002)(5660300002)(53416004)(14444005)(8676002)(2906002)(36756003)(2616005)(476003)(126002)(426003)(51416003)(7696005)(316002)(50226002)(16586007)(6916009)(47776003)(86362001)(26005)(48376002)(4326008)(50466002)(186003)(81156014)(81166006)(305945005)(8936002)(70586007)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36387c14-c3ba-445f-1c75-08d71ef8abca
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB271934FDD1AE4F2AA58125968FD30@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 012792EC17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yoCTQw5cIDenmsURkVdGfgsS62RfeYOzcebQ8l17KLofA/WsY2ffdlGbAJTOR3TrFotopXUQSMM18bKHoHD7cJw1WzYSNgEaucXfV6vsIkhN/LycpAxAAXLsUkbGlKoz3/WOBZI6ODdjjaa0IebqWR+3yrrxZbmFQmjuQ7owEFgZ1HwM0VdfehKPrDHyH1GD/n2kTRBard8+etoB93JiSxdGtPPyw8fCJ5bWniKW4cPtGT9IyhMogMZZ/55utdfsUmbYG7R7Njz5LKvzp8V1fFlfs6XkWPWGv3b/xQoVcwkWp8sLy00ymLrczAWz1XoxkR8Qz34XKVmRfrKJmTKNo2Q/oNfBexZc8BXq49JoosjFJ+pDDsghFotrSCjQqTkhicRjSqTk1aWuEjDURyyQHcmZ3I3j/t5C/VvZXcDOZAA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2019 07:42:47.7125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36387c14-c3ba-445f-1c75-08d71ef8abca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4oW2S3EObLX6cMU6lSobHzZiIiGtmsRJyLdjAHQ+3U=;
 b=mDxtUaIxHX1YmiNn9KAKHDaGjmoMiVnPFe7RwaiJ8943gKkM0Y8qnoklPkWKKpXnGog3f20Hr7usO2DZ1+S8uDk9blPSCRW5VaQMLIbChyWrYD5hKTai6JBaVj5+lYvrIPKbLiBVRiwSFptcePTIjtVDrUA6b9N6hTlJoOPSfcU=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIHNwc2MgcXVldWUsIHVzZSBwZWVrIGZ1bmN0aW9uIHdvdWxkIGNhdXNlIGVycm9yIGluIHBy
b2R1Y3RvciBzaWRlLgpBcyBmb3IgdGhlIGxhc3QgZWxlbWVudCwgd2hlbiB0aGUgcHVzaCBqb2Ig
aXMgb2NjdXJyaW5nIGR1cmluZyBwb3Agam9iLCB0aGUgcGVlayBmdW5jdGlvbgp3aWxsIG5vdCBi
ZSB1cGRhdGVkIGluIHRpbWUsIGFuZCBpdCB3aWxsIHJldHVybiBOVUxMLgoKU28gdXNlIHF1ZXVl
IGNvdW50IGZvciBkb3VibGUgY29uZmlybWluZyB0aGUgam9iIHF1ZXVlIGlzIGVtcHR5LgoKU2ln
bmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCA0ICsrLS0KIGluY2x1ZGUvZHJtL3Nw
c2NfcXVldWUuaCAgICAgICAgICAgICAgICAgfCA3ICsrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX2VudGl0eS5jCmluZGV4IDM1ZGRiZWMuLmU3NDg5NGYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwpAQCAtOTUsNyArOTUsNyBAQCBzdGF0aWMgYm9vbCBk
cm1fc2NoZWRfZW50aXR5X2lzX2lkbGUoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkK
IAlybWIoKTsgLyogZm9yIGxpc3RfZW1wdHkgdG8gd29yayB3aXRob3V0IGxvY2sgKi8KIAogCWlm
IChsaXN0X2VtcHR5KCZlbnRpdHktPmxpc3QpIHx8Ci0JICAgIHNwc2NfcXVldWVfcGVlaygmZW50
aXR5LT5qb2JfcXVldWUpID09IE5VTEwpCisJICAgICgoc3BzY19xdWV1ZV9wZWVrKCZlbnRpdHkt
PmpvYl9xdWV1ZSkgPT0gTlVMTCkgJiYgIXNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1
ZXVlKSkpCiAJCXJldHVybiB0cnVlOwogCiAJcmV0dXJuIGZhbHNlOwpAQCAtMjgxLDcgKzI4MSw3
IEBAIHZvaWQgZHJtX3NjaGVkX2VudGl0eV9maW5pKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpl
bnRpdHkpCiAJLyogQ29uc3VtcHRpb24gb2YgZXhpc3RpbmcgSUJzIHdhc24ndCBjb21wbGV0ZWQu
IEZvcmNlZnVsbHkKIAkgKiByZW1vdmUgdGhlbSBoZXJlLgogCSAqLwotCWlmIChzcHNjX3F1ZXVl
X3BlZWsoJmVudGl0eS0+am9iX3F1ZXVlKSkgeworCWlmICgoc3BzY19xdWV1ZV9wZWVrKCZlbnRp
dHktPmpvYl9xdWV1ZSkgPT0gTlVMTCkgJiYgIXNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9i
X3F1ZXVlKSkgewogCQlpZiAoc2NoZWQpIHsKIAkJCS8qIFBhcmsgdGhlIGtlcm5lbCBmb3IgYSBt
b21lbnQgdG8gbWFrZSBzdXJlIGl0IGlzbid0IHByb2Nlc3NpbmcKIAkJCSAqIG91ciBlbml0eS4K
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3Nwc2NfcXVldWUuaCBiL2luY2x1ZGUvZHJtL3Nwc2Nf
cXVldWUuaAppbmRleCAxMjVmMDk2Li43ODA5MmI5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9z
cHNjX3F1ZXVlLmgKKysrIGIvaW5jbHVkZS9kcm0vc3BzY19xdWV1ZS5oCkBAIC01NCw5ICs1NCw4
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzcHNjX3F1ZXVlX2luaXQoc3RydWN0IHNwc2NfcXVldWUg
KnF1ZXVlKQogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBzcHNjX25vZGUgKnNwc2NfcXVldWVfcGVl
ayhzdHJ1Y3Qgc3BzY19xdWV1ZSAqcXVldWUpCiB7Ci0JcmV0dXJuIHF1ZXVlLT5oZWFkOworCXJl
dHVybiBSRUFEX09OQ0UocXVldWUtPmhlYWQpOwogfQotCiBzdGF0aWMgaW5saW5lIGludCBzcHNj
X3F1ZXVlX2NvdW50KHN0cnVjdCBzcHNjX3F1ZXVlICpxdWV1ZSkKIHsKIAlyZXR1cm4gYXRvbWlj
X3JlYWQoJnF1ZXVlLT5qb2JfY291bnQpOwpAQCAtNzAsOSArNjksOSBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgc3BzY19xdWV1ZV9wdXNoKHN0cnVjdCBzcHNjX3F1ZXVlICpxdWV1ZSwgc3RydWN0IHNw
c2Nfbm9kZSAqbgogCiAJcHJlZW1wdF9kaXNhYmxlKCk7CiAKKwlhdG9taWNfaW5jKCZxdWV1ZS0+
am9iX2NvdW50KTsKIAl0YWlsID0gKHN0cnVjdCBzcHNjX25vZGUgKiopYXRvbWljX2xvbmdfeGNo
ZygmcXVldWUtPnRhaWwsIChsb25nKSZub2RlLT5uZXh0KTsKIAlXUklURV9PTkNFKCp0YWlsLCBu
b2RlKTsKLQlhdG9taWNfaW5jKCZxdWV1ZS0+am9iX2NvdW50KTsKIAogCS8qCiAJICogSW4gY2Fz
ZSBvZiBmaXJzdCBlbGVtZW50IHZlcmlmeSBuZXcgbm9kZSB3aWxsIGJlIHZpc2libGUgdG8gdGhl
IGNvbnN1bWVyCkBAIC05Myw2ICs5Miw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNwc2Nfbm9k
ZSAqc3BzY19xdWV1ZV9wb3Aoc3RydWN0IHNwc2NfcXVldWUgKnF1ZXVlKQogCS8qIFZlcmlmeSBy
ZWFkaW5nIGZyb20gbWVtb3J5IGFuZCBub3QgdGhlIGNhY2hlICovCiAJc21wX3JtYigpOwogCisJ
YXRvbWljX2RlYygmcXVldWUtPmpvYl9jb3VudCk7CiAJbm9kZSA9IFJFQURfT05DRShxdWV1ZS0+
aGVhZCk7CiAKIAlpZiAoIW5vZGUpCkBAIC0xMTMsNyArMTEzLDYgQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3Qgc3BzY19ub2RlICpzcHNjX3F1ZXVlX3BvcChzdHJ1Y3Qgc3BzY19xdWV1ZSAqcXVldWUp
CiAJCX0KIAl9CiAKLQlhdG9taWNfZGVjKCZxdWV1ZS0+am9iX2NvdW50KTsKIAlyZXR1cm4gbm9k
ZTsKIH0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
